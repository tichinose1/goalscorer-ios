//
//  Association.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/31.
//  Copyright © 2018 example.com. All rights reserved.
//

import CoreLocation
import RealmSwift

class Association: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var regionCode: String = ""
    @objc dynamic var latitude: Double = 0
    @objc dynamic var longitude: Double = 0
    let competitions = List<Competition>()
    let players = List<Player>()

    convenience init(name: String, regionCode: String, latitude: Double, longitude: Double, competitions: [Competition], players: [Player]) {
        self.init()

        self.name = name
        self.regionCode = regionCode
        self.latitude = latitude
        self.longitude = longitude
        self.competitions.append(objectsIn: competitions)
        self.players.append(objectsIn: players)
    }

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
