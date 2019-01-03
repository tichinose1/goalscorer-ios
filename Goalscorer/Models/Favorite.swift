//
//  Favorite.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/03.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation

struct Favorite {
    let url: String
    var lastReadAt: Date? = nil
    var lastUpdatedAt: Date? = nil
}

extension Favorite: Codable {
}

extension Favorite {

    var topScorer: TopScorer {
        return TopScorer.all.first { $0.url == url }!
    }
}
