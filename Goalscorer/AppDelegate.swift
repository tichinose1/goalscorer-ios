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

        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            print("granted: \(granted)")
            if let error = error {
                print(error.localizedDescription)
            }
        }

        DataInitializer().initData()

        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let dispatchGroup = DispatchGroup()

        let favorites = LocalStorage<Favorite>().findAll()
        favorites.forEach { favorite in
            dispatchGroup.enter()
            WebAPI.shared.checkUpdate(title: favorite.topScorer.title) { timestamp in
                DispatchQueue.main.async {
                    LocalStorage<Favorite>().update {
                        favorite.lastUpdatedAt = timestamp
                    }
                    dispatchGroup.leave()
                }
            }
        }

        dispatchGroup.notify(queue: .main) {
            self.addNotificationIfNeeded()

            completionHandler(.newData)
        }
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    }
}

private extension AppDelegate {

    func addNotificationIfNeeded() {
        // TODO: 複雑な条件のクエリをSQLでやるかどうか
        let favorites = LocalStorage<Favorite>().findAll()
        let updatedFavorites = favorites.filter { $0.updated }
        guard updatedFavorites.count > 0 else { return }

        let body = updatedFavorites.map { $0.topScorer.title }.joined(separator: ", ")
        addNotification(body: body)
    }

    func addNotification(body: String) {
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

        UIApplication.shared.applicationIconBadgeNumber = 1
    }
}
