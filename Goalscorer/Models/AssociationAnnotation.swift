//
//  AssociationAnnotation.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/31.
//  Copyright © 2018 example.com. All rights reserved.
//

import MapKit
import Firebase

final class AssociationAnnotation: MKPointAnnotation {
    let association: DocumentSnapshot
    var competitions: [QueryDocumentSnapshot] = []

    init(snapshot: DocumentSnapshot) {
        self.association = snapshot

        super.init()

        let geoPoint = snapshot["coordinate"] as! GeoPoint
        self.coordinate = CLLocationCoordinate2D(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
        self.title = snapshot["name"] as! String
    }

    func setCompetitions(snapshots: [QueryDocumentSnapshot]) {
        competitions = snapshots
        subtitle = snapshots.map { $0["name"] as! String }.joined(separator: ", ")
    }
}
