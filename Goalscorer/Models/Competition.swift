//
//  Competition.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/11.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import RealmSwift
import Firebase

@objcMembers
class Competition: Object {
    dynamic var name: String = ""
    dynamic var association: Association!
    dynamic var kind: String = ""
    dynamic var order: Int = 0

    let scorers = LinkingObjects(fromType: Scorer.self, property: "competition")
}

struct CompetitionPlain {
    let id: String
    let name: String
    let association: AssociationPlain
    let kind: String
    let order: Int

    init(data: QueryDocumentSnapshot, association: AssociationPlain) {
        id = data.documentID
        name = data["name"] as! String
        self.association = association
        kind = data["kind"] as! String
        order = data["order"] as! Int
    }
}
