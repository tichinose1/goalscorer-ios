//
//  Favorite.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/03.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class Favorite: Object {
    dynamic var createdAt: Date = Date()
    dynamic var lastReadAt: Date?
    dynamic var lastUpdatedAt: Date?
    let topScorers = List<TopScorer>()

    var topScorer: TopScorer {
        return topScorers.first!
    }

    var updated: Bool {
        // サーバーの更新時刻を未取得の場合は判断できない
        if let lastUpdatedAt = lastUpdatedAt {
            switch lastReadAt {
            case .some(let lastReadAt):
                // favorite追加後にreadしている場合
                if lastReadAt < lastUpdatedAt {
                    return true
                }
            case .none:
                // favorite追加後にreadしていない場合
                // 一度readした後は二度とこの条件では判定されない
                if createdAt < lastUpdatedAt {
                    return true
                }
            }
        }
        return false
    }
}
