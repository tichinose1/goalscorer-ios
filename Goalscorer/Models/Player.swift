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

    convenience init(name: String, order: Int? = nil) {
        self.init()

        self.name = name
        self.order = order ?? 999
    }

    func setProperties(association: Association) {
        self.association = association
        self.url = "https://en.wikipedia.org/wiki/\(path)#Career_statistics"
    }
}

private extension Player {

    private var path: String {
        return name
            .replacingOccurrences(of: " ", with: "_")
            // `-` を置換
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
    }
}
