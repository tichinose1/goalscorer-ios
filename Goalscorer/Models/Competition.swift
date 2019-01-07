//
//  Competition.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/11.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class Competition: Object {
    dynamic var name: String = ""
    dynamic var association: Association!
    dynamic var order: Int = 0

    let topScorers = LinkingObjects(fromType: TopScorer.self, property: "competition")

    var topScorersTemp: [TopScorer] = []
    var overallTopScorersTemp: [OverallTopScorer] = []

    convenience init(name: String, topScorers: [TopScorer], overallTopScorers: [OverallTopScorer]) {
        self.init()

        self.name = name

        self.topScorersTemp = topScorers
        self.overallTopScorersTemp = overallTopScorers
    }

    override static func ignoredProperties() -> [String] {
        return ["topScorersTemp", "overallTopScorersTemp"]
    }
}
