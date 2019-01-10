//
//  DataInitializer.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/06.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation
import RealmSwift

final class DataInitializer {

    func initData() {
        initRealm()

        importOldFromUserDefaults()
    }
}

private extension DataInitializer {

    func initRealm() {
        let storageURL = Realm.Configuration.defaultConfiguration.fileURL!
        if FileManager.default.fileExists(atPath: storageURL.path) {
            return
        }

        let bundleURL = Bundle.main.url(forResource: "default", withExtension: "realm")!
        do {
            try FileManager.default.copyItem(at: bundleURL, to: storageURL)
        } catch {
            print(error.localizedDescription)
        }
    }

    func importOldFromUserDefaults() {
        UserDefaultsDAO().loadOldFavorites()
            .map { plainObject in
                let realmObject = FavoriteScorer()
                let scorers = RealmDAO<Scorer>().findAll().filter("url == '\(plainObject.url)'")
                realmObject.scorer = scorers.first!
                realmObject.createdAt = plainObject.createdAt
                realmObject.lastReadAt = plainObject.lastReadAt
                realmObject.lastUpdatedAt = plainObject.lastUpdatedAt
                return realmObject
            }
            .forEach {
                RealmDAO<FavoriteScorer>().add(t: $0)
            }
        UserDefaultsDAO().saveOldFavorites([])
    }
}
