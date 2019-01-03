//
//  AppDelegate.swift
//  FootbballLink
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NSSetUncaughtExceptionHandler {
            print($0)
        }

        application.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)

        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let dispatchGroup = DispatchGroup()

        LocalStorage.shared.readFavorites().forEach { favorite in
            dispatchGroup.enter()
            WebAPI.shared.checkUpdate(title: favorite.topScorer.title) { timestamp in
                print(timestamp)
                LocalStorage.shared.updateFavorite(url: favorite.url, lastUpdatedAt: timestamp)

                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            completionHandler(.newData)
        }
    }
}
