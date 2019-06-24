//
//  GlobalData.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/06/24.
//  Copyright © 2019 example.com. All rights reserved.
//

import UIKit

final class GlobalData {

    static let shared = GlobalData()

    private init() { }

    var associations: [AssociationPlain] = []
    var competitions: [CompetitionPlain] = []

    func findAssociation(associationID: String) -> AssociationPlain {
        return associations.first { $0.id == associationID }!
    }

    func findCompetition(competitionID: String) -> CompetitionPlain {
        return competitions.first { $0.id == competitionID }!
    }
}
