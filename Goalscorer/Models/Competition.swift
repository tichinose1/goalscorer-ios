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
}
