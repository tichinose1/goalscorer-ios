//
//  Association.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/31.
//  Copyright © 2018 example.com. All rights reserved.
//

import CoreLocation

struct Association {
    let name: String
    let regionCode: String
    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    var competitions: [Competition] {
        return Competition.all.filter { $0.association == self }
    }
}

extension Association: Comparable {

    static func < (lhs: Association, rhs: Association) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Association: Codable {
}

extension Association {

    static let all: [Association] = [.fifa,
                                     .uefa, .spain, .england, .italy, .germany, .france, .russia, .portugal, .belguim, .ukraine, .turkey, .netherlands, .austria, .poland, .bosniaAndHerzegovina, .wales, .sweden, .ireland, .croatia, .israel, .serbia,
                                     .conmebol, .brazil, .argentina, .uruguay, .colombia, .chile,
                                     .concacaf, .unitedStates, .mexico,
                                     .caf, .gabon, .egypt, .cameroon, .mali, .senegal, .algeria,
                                     .ofc,
                                     .afc, .australia, .qatar, unitedArabEmirates, .iran, .saudiArabia, .china, .southKorea, .japan]

    // FIFA
    static let fifa =       Association(name: "FIFA",       regionCode: "WW",       latitude: 47.381389,    longitude: 8.574444)
        // UEFA
    static let uefa =       Association(name: "UEFA",       regionCode: "CEU",      latitude: 46.371009,    longitude: 6.23103)
    static let spain =       Association(name: "Spain",       regionCode: "ES",       latitude: 40.383333,    longitude: -3.716667)
    static let england =         Association(name: "England",         regionCode: "GB-ENG",   latitude: 51.5,         longitude: -0.116667)
    static let italy =       Association(name: "Italy",       regionCode: "IT",       latitude: 41.9,         longitude: 12.483333)
    static let germany =        Association(name: "Germany",        regionCode: "DE",       latitude: 50.116667,    longitude: 8.683333)
    static let france =        Association(name: "France",        regionCode: "FR",       latitude: 48.8567,      longitude: 2.3508)
    static let russia =        Association(name: "Russia",        regionCode: "RU",       latitude: 55.75,        longitude: 37.616667)
    static let portugal =        Association(name: "Portugal",        regionCode: "PT",       latitude: 38.713889,    longitude: -9.139444)
    static let belguim =       Association(name: "Belguim",       regionCode: "BE",       latitude: 50.85,        longitude: 4.35)
    static let ukraine =        Association(name: "Ukraine",        regionCode: "UA",       latitude: 50.45,        longitude: 30.523333)
    static let turkey =        Association(name: "Turkey",        regionCode: "TR",       latitude: 41.013611,    longitude: 28.955)
    static let netherlands =       Association(name: "Netherlands",       regionCode: "NL",       latitude: 52.083333,    longitude: 5.233333)
    static let austria =        Association(name: "Austria",        regionCode: "AT",       latitude: 48.2,         longitude: 16.366667)

    static let poland = Association(name: "Poland", regionCode: "PL", latitude: 52.233333, longitude: 21.016667)
    static let bosniaAndHerzegovina = Association(name: "Bosnia and Herzegovina", regionCode: "BA", latitude: 43.866667, longitude: 18.416667)
    static let wales = Association(name: "Wales", regionCode: "GB-WLS", latitude: 52.3, longitude: -3.6)
    static let sweden = Association(name: "Sweden", regionCode: "SE", latitude: 59.35, longitude: 18)
    static let ireland = Association(name: "Ireland", regionCode: "IE", latitude: 53.344167, longitude: -6.2675)
    static let croatia = Association(name: "Croatia", regionCode: "HR", latitude: 45.8, longitude: 16)
    static let israel = Association(name: "Israel", regionCode: "IL", latitude: 31.783333, longitude: 35.216667)
    static let serbia = Association(name: "Serbia", regionCode: "RS", latitude: 44.8, longitude: 20.466667)
        // CONMEBOL
    static let conmebol =   Association(name: "CONMEBOL",   regionCode: "CSA",      latitude: -25.260556,   longitude: -57.516111)
    static let brazil =        Association(name: "Brazil",        regionCode: "BR",       latitude: -22.908333,   longitude: -43.196389)
    static let argentina =        Association(name: "Argentina",        regionCode: "AR",       latitude: -34.603333,   longitude: -58.381667)

    static let uruguay = Association(name: "Uruguay", regionCode: "UY", latitude: -34.883611, longitude: -56.181944)
    static let colombia = Association(name: "Colombia", regionCode: "CO", latitude: 4.583333, longitude: -74.066667)
    static let chile = Association(name: "Chile", regionCode: "CL", latitude: -33.433333, longitude: -70.666667)
        // CONCACAF
    static let concacaf =   Association(name: "CONCACAF",   regionCode: "CNA",      latitude: 25.773,       longitude: -80.138)
    static let unitedStates =       Association(name: "United States",       regionCode: "US",       latitude: 41.836944,    longitude: -87.684722)
    static let mexico =        Association(name: "Mexico",        regionCode: "MX",       latitude: 19.409444,    longitude: -99.130833)
        // CAF
    static let caf =        Association(name: "CAF",        regionCode: "CAF",      latitude: 29.938126,    longitude: 30.91398)

    static let gabon = Association(name: "Gabon", regionCode: "GA", latitude: 0.383333, longitude: 9.45)
    static let egypt = Association(name: "Egypt", regionCode: "EG", latitude: 30.033333, longitude: 31.233333)
    static let cameroon = Association(name: "Cameroon", regionCode: "CM", latitude: 3.866667, longitude: 11.516667)
    static let mali = Association(name: "Mali", regionCode: "ML", latitude: 12.65, longitude: -8)
    static let senegal = Association(name: "Senegal", regionCode: "SN", latitude: 14.666667, longitude: -17.416667)
    static let algeria = Association(name: "Algeria", regionCode: "DZ", latitude: 36.7, longitude: 3.216667)
        // OFC
    static let ofc =        Association(name: "OFC",        regionCode: "COC",      latitude: -36.840556,   longitude: 174.74)
        // AFC
    static let afc =        Association(name: "AFC",        regionCode: "CAS",      latitude: 3.056296,     longitude: 101.688919)
    static let australia =        Association(name: "Australia",        regionCode: "AU",       latitude: -33.865,      longitude: 151.209444)
    static let qatar =        Association(name: "Qatar",        regionCode: "QA",       latitude: 25.3,         longitude: 51.516667)
    static let unitedArabEmirates =      Association(name: "United Arab Emirates",      regionCode: "AE",       latitude: 25.263056,    longitude: 55.297222)
    static let iran =      Association(name: "Iran",      regionCode: "IR",       latitude: 35.683333,    longitude: 51.416667)
    static let saudiArabia =       Association(name: "Saudi Arabia",       regionCode: "SA",       latitude: 24.633333,    longitude: 46.716667)
    static let china =        Association(name: "China",        regionCode: "CN",       latitude: 39.916667,    longitude: 116.383333)
    static let southKorea =        Association(name: "South Korea",        regionCode: "KR",       latitude: 37.55,        longitude: 126.966667)
    static let japan =        Association(name: "Japan",        regionCode: "JP",       latitude: 35.683333,    longitude: 139.766667)
}
