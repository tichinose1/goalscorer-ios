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
import RxSwift
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let disposeBag = DisposeBag()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

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

        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        performFetch(completionHandler: completionHandler)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    // TODO: ログ出力
}

private extension AppDelegate {

    func performFetch(completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let favorites = RealmDAO<FavoriteScorer>().findAll()

        let updateSingles = favorites.map(updateFavorite)
        Single.zip(updateSingles)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onSuccess: { closures in
                    RealmDAO<FavoriteScorer>().update {
                        closures.forEach { closure in
                            closure()
                        }
                    }
                    self.addNotificationIfNeeded()
                    completionHandler(.newData)
                },
                onError: { _ in
                    completionHandler(.failed)
                })
            .disposed(by: disposeBag)
    }

    func updateFavorite(favorite: FavoriteScorer) -> Single<() -> Void> {
        return WikipediaClient().searchPageRevision(title: favorite.scorer.title)
            .map { $0.query.pages.first!.value.revisions.first!.timestamp }
            .map { timestamp in
                // 後でまとめて実施するためにクロージャとして返す
                { favorite.lastUpdatedAt = timestamp }
            }
    }

    func addNotificationIfNeeded() {
        // TODO: 複雑な条件のクエリをSQLでやるかどうか
        let updatedFavorites = RealmDAO<FavoriteScorer>().findAll().filter { $0.updated }
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
        let request = UNNotificationRequest(identifier: "favoriteScorersUpdate",
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
