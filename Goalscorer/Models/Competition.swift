//
//  Competition.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/11.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import RealmSwift

class Competition: Object {
    @objc dynamic var name: String = ""
    let topScorers = List<TopScorer>()
    let allTimeTopScorers = List<AllTimeTopScorer>()
    let associations = LinkingObjects(fromType: Association.self, property: "competitions")

    convenience init(name: String, topScorers: [TopScorer], allTimeTopScorers: [AllTimeTopScorer]) {
        self.init()

        self.name = name
        self.topScorers.append(objectsIn: topScorers)
        self.allTimeTopScorers.append(objectsIn: allTimeTopScorers)
    }

    var association: Association {
        return associations.first!
    }
}
