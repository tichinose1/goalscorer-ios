//
//  Player.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import Firebase

struct PlayerPlain {
    let id: String
    let url: String
    let name: String
    let association: AssociationPlain
    let order: Int

    init(data: QueryDocumentSnapshot, association: AssociationPlain) {
        id = data.documentID
        url = data["url"] as! String
        name = data["name"] as! String
        self.association = association
        order = data["order"] as! Int
    }
}
