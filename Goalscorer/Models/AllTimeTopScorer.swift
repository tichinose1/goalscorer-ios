//
//  AllTimeTopScorer.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/13.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import RealmSwift

class AllTimeTopScorer: Object {
    @objc dynamic var url: String = ""
    let competitions = LinkingObjects(fromType: Competition.self, property: "allTimeTopScorers")

    convenience init(url: String) {
        self.init()

        self.url = url
    }

    var competition: Competition {
        return competitions.first!
    }
}
