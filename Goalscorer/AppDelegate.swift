//
//  AppDelegate.swift
//  FootbballLink
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import UserNotifications
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NSSetUncaughtExceptionHandler {
            print($0)
        }

        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            print("granted: \(granted)")
            if let error = error {
                print(error.localizedDescription)
            }
        }

        DataInitializer().initData()

        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // TODO: やはりRxSwift使った方が良い
        let dispatchGroup = DispatchGroup()

        var closures: [() -> Void] = []
        let favorites = LocalStorage<FavoriteScorer>().findAll()
        favorites.forEach { favorite in
            dispatchGroup.enter()
            WebAPI.shared.checkUpdate(title: favorite.scorer.title) { timestamp in
                closures.append {
                    favorite.lastUpdatedAt = timestamp
                }

                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            LocalStorage<FavoriteScorer>().update {
                closures.forEach {
                    $0()
                }
            }

            self.addNotificationIfNeeded()

            completionHandler(.newData)
        }
    }
}

private extension AppDelegate {

    func addNotificationIfNeeded() {
        // TODO: 複雑な条件のクエリをSQLでやるかどうか
        let favorites = LocalStorage<FavoriteScorer>().findAll()
        let updatedFavorites = favorites.filter { $0.updated }
        guard updatedFavorites.count > 0 else { return }

        let body = updatedFavorites.map { $0.scorer.title }.joined(separator: ", ")
        addNotification(body: body, badgeNumber: updatedFavorites.count)
    }

    func addNotification(body: String, badgeNumber: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Updated!"
        content.body = body
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "favoritesUpdate",
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }

        UIApplication.shared.applicationIconBadgeNumber = badgeNumber
    }
}
