//
//  Scorer.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import RealmSwift
import Firebase

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

struct ScorerPlain {
    let id: String
    let url: String
    let title: String
    let competition: CompetitionPlain
    let season: String

    init(data: QueryDocumentSnapshot, competition: CompetitionPlain) {
        id = data.documentID
        url = data["url"] as! String
        title = data["title"] as! String
        self.competition = competition
        season = data["season"] as! String
    }
}
