//
//  AllTimeTopScorer.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/13.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class AllTimeTopScorer: Object {
    dynamic var competition: Competition!
    dynamic var url: String = ""

    convenience init(url: String) {
        self.init()

        self.url = url
    }
}
