//
//  FavoriteScorerPlain.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/09.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation

struct FavoriteScorerPlain {
    let url: String
    let createdAt: Date
    let lastReadAt: Date?
    let lastUpdatedAt: Date?
}

extension FavoriteScorerPlain: Codable {
}

extension FavoriteScorerPlain {

    init(realmObject: FavoriteScorer) {
        self.init(url: realmObject.url,
                  createdAt: realmObject.createdAt,
                  lastReadAt: realmObject.lastReadAt,
                  lastUpdatedAt: realmObject.lastUpdatedAt)
    }
}
