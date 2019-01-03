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
        guard let favorite = LocalStorage.shared.loadFavoriteTopScorers().first else {
            return
        }
        guard let topScorer = (TopScorer.all.first { $0.url == favorite }) else {
            return
        }

        var component = URLComponents(string: "https://en.wikipedia.org/w/api.php")!
        component.queryItems = [
            URLQueryItem(name: "action", value: "query"),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "prop", value: "revisions"),
            URLQueryItem(name: "titles", value: topScorer.title),
            URLQueryItem(name: "rvlimit", value: "1")
        ]

        URLSession.shared.dataTask(with: component.url!) { data, response, error in
            defer {
                completionHandler(.newData)
            }

            guard let data = data else {
                return
            }
            guard let jsonText = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) else {
                return
            }
            guard let dic = jsonText as? [String: Any] else {
                print("jsonText: \(jsonText)")
                return
            }
            guard let query = dic["query"] as? [String: Any] else {
                print("dic: \(dic)")
                return
            }
            guard let pages = query["pages"] as? [String: Any] else {
                print("query: \(query)")
                return
            }
            guard let page = pages.values.first as? [String: Any] else {
                print("pages: \(pages)")
                return
            }
            guard let revisions = page["revisions"] as? [Any] else {
                print("page: \(page)")
                return
            }
            guard let revision = revisions.first as? [String: Any] else {
                print("revisions: \(revisions)")
                return
            }
            guard let timestamp = revision["timestamp"] else {
                print("revision: \(revision)")
                return
            }

            print(timestamp)
        }.resume()
    }
}
