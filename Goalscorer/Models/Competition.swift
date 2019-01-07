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
    let topScorers = LinkingObjects(fromType: TopScorer.self, property: "competition")

    convenience init(name: String, topScorers: [TopScorer], allTimeTopScorers: [AllTimeTopScorer]) {
        self.init()

        self.name = name
    }
}
