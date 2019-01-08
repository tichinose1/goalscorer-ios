//
//  Wikipedia.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/03.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation

struct Wikipedia: Decodable {
    let query: Query

    struct Query: Decodable {
        let pages: Pages

        typealias Pages = [String: Page]

        struct Page: Decodable {
            let revisions: [Revision]

            struct Revision: Decodable {
                let timestamp: Date
            }
        }
    }
}
