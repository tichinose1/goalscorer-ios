//
//  Scorer.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class Scorer: Object {
    dynamic var url: String = ""
    dynamic var title: String = ""
    dynamic var competition: Competition!
    dynamic var season: String = ""

    let favorites = LinkingObjects(fromType: FavoriteScorer.self, property: "scorer")
    var favorite: FavoriteScorer? {
        return favorites.first
    }
}
