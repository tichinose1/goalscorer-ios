//
//  Association.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/31.
//  Copyright © 2018 example.com. All rights reserved.
//

import CoreLocation
import RealmSwift
import Firebase

@objcMembers
class Association: Object {
    dynamic var regionCode: String = ""
    dynamic var name: String = ""
    dynamic var latitude: Double = 0
    dynamic var longitude: Double = 0
    
    let competitions = LinkingObjects(fromType: Competition.self, property: "association")

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct AssociationPlain {
    let id: String
    let regionCode: String
    let name: String
    private let coordinate: GeoPoint
    var latitude: Double {
        return coordinate.latitude
    }
    var longitude: Double {
        return coordinate.longitude
    }

    init(data: QueryDocumentSnapshot) {
        id = data.documentID
        regionCode = data["region_code"] as! String
        name = data["name"] as! String
        coordinate = data["coordinate"] as! GeoPoint
    }
}

import FlagKit

extension AssociationPlain {

    var image: UIImage? {
        switch regionCode {
        case "CAF", "CAS", "CEU", "CNA", "COC", "CSA", "WW":
            return UIImage(named: regionCode)
        default:
            return Flag(countryCode: regionCode)?.image(style: .roundedRect)
        }
    }
}
