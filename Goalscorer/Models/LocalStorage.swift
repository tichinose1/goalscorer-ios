//
//  LocalStorage.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/03.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation
import RealmSwift

final class LocalStorage<T: Object> {

    let realm: Realm

    init() {
        realm = try! Realm()
    }

    func findAll() -> Results<T> {
        return realm.objects(T.self)
    }

    func add(t: T) {
        // 重複チェックは呼び出し元で実施する

        try! realm.write {
            realm.add(t)
        }
    }

    func update(block: () -> Void) {
        try! realm.write {
            block()
        }
    }

    func delete(t: T) {
        try! realm.write {
            realm.delete(t)
        }
    }
}
