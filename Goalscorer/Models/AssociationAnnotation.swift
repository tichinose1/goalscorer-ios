//
//  AssociationAnnotation.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/31.
//  Copyright © 2018 example.com. All rights reserved.
//

import MapKit

final class AssociationAnnotation: MKPointAnnotation {
    let association: Association

    init(association: Association) {
        self.association = association

        super.init()

        self.coordinate = association.coordinate
        self.title = association.name
        self.subtitle = association.competitions.map { $0.name }.joined(separator: ", ")
    }
}
