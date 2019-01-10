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
}
