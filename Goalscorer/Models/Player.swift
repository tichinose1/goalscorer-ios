//
//  Player.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class Player: Object {
    dynamic var url: String = ""
    dynamic var name: String = ""
    dynamic var association: Association!
    dynamic var order: Int = 999
}
