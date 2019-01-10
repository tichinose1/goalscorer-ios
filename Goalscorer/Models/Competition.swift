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
    dynamic var kind: String = ""
    dynamic var order: Int = 0

    let scorers = LinkingObjects(fromType: Scorer.self, property: "competition")

    var scorersTemp: [Scorer] = []
    var overallScorersTemp: [OverallScorer] = []

    override static func ignoredProperties() -> [String] {
        return ["scorersTemp", "overallScorersTemp"]
    }

    convenience init(name: String, kind: String, order: Int, scorers: [Scorer], overallScorers: [OverallScorer]) {
        self.init()

        self.name = name
        self.kind = kind
        self.order = order

        self.scorersTemp = scorers
        self.overallScorersTemp = overallScorers
    }

    func setProperties(association: Association) {
        self.association = association
    }
}
