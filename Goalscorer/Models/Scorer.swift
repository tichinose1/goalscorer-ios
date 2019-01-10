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

    var header: String = ""

    override static func ignoredProperties() -> [String] {
        return ["header"]
    }

    convenience init(season: String, header: String) {
        self.init()

        self.season = season
        self.header = header
    }

    func setProperties(competition: Competition) {
        self.competition = competition
        self.title = {
            // TODO: 特別扱いをやめたい
            if competition.name == "UEFA Euro" {
                return "\(competition.name) \(season)"
            } else if competition.name == "Copa América" && season == "2016" {
                return "Copa América Centenario"
            }

            return "\(season) \(competition.name)"

        }()
        self.url = "https://en.wikipedia.org/wiki/\(path)#\(fragment)"
    }
}

private extension Scorer {

    var path: String {
        return title
            .replacingOccurrences(of: " ", with: "_")
            // `-` を置換
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
    }

    var fragment: String {
        return header.replacingOccurrences(of: " ", with: "_")
    }
}
