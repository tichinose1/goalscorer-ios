//
//  OverallScorer.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/13.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation
import Firebase

struct OverallScorerPlain {
    let id: String
    let url: String
    let competition: CompetitionPlain

    init(data: QueryDocumentSnapshot, competition: CompetitionPlain) {
        id = data.documentID
        url = data["url"] as! String
        self.competition = competition
    }
}
