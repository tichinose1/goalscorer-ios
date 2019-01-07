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
    dynamic var url: String = ""
    dynamic var competition: Competition!

    convenience init(url: String) {
        self.init()

        self.url = url
    }
}
