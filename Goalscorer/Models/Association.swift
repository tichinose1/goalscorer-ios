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
                                     .uefa, .rfef, .fa, .figc, .dfb, .fff, .rfs, .fpf, .kbvb, .ffu, .tff, .knvb, .ofb,
                                     .conmebol, .cbf, .afa,
                                     .concacaf, .ussf, .fmf,
                                     .caf,
                                     .ofc,
                                     .afc, .ffa, .qfa, uaefa, .ffiri, .saff, .cfa, .kfa, .jfa]

    // FIFA
    static let fifa =       Association(name: "FIFA",       regionCode: "WW",       latitude: 47.381389,    longitude: 8.574444)
        // UEFA
    static let uefa =       Association(name: "UEFA",       regionCode: "CEU",      latitude: 46.371009,    longitude: 6.23103)
    static let rfef =       Association(name: "RFEF",       regionCode: "ES",       latitude: 40.383333,    longitude: -3.716667)
    static let fa =         Association(name: "FA",         regionCode: "GB-ENG",   latitude: 51.5,         longitude: -0.116667)
    static let figc =       Association(name: "FIGC",       regionCode: "IT",       latitude: 41.9,         longitude: 12.483333)
    static let dfb =        Association(name: "DFB",        regionCode: "DE",       latitude: 50.116667,    longitude: 8.683333)
    static let fff =        Association(name: "FFF",        regionCode: "FR",       latitude: 48.8567,      longitude: 2.3508)
    static let rfs =        Association(name: "RFS",        regionCode: "RU",       latitude: 55.75,        longitude: 37.616667)
    static let fpf =        Association(name: "FPF",        regionCode: "PT",       latitude: 38.713889,    longitude: -9.139444)
    static let kbvb =       Association(name: "KBVB",       regionCode: "BE",       latitude: 50.85,        longitude: 4.35)
    static let ffu =        Association(name: "FFU",        regionCode: "UA",       latitude: 50.45,        longitude: 30.523333)
    static let tff =        Association(name: "TFF",        regionCode: "TR",       latitude: 41.013611,    longitude: 28.955)
    static let knvb =       Association(name: "KNVB",       regionCode: "NL",       latitude: 52.083333,    longitude: 5.233333)
    static let ofb =        Association(name: "OFB",        regionCode: "AT",       latitude: 48.2,         longitude: 16.366667)
        // CONMEBOL
    static let conmebol =   Association(name: "CONMEBOL",   regionCode: "CSA",      latitude: -25.260556,   longitude: -57.516111)
    static let cbf =        Association(name: "CBF",        regionCode: "BR",       latitude: -22.908333,   longitude: -43.196389)
    static let afa =        Association(name: "AFA",        regionCode: "AR",       latitude: -34.603333,   longitude: -58.381667)
        // CONCACAF
    static let concacaf =   Association(name: "CONCACAF",   regionCode: "CNA",      latitude: 25.773,       longitude: -80.138)
    static let ussf =       Association(name: "USSF",       regionCode: "US",       latitude: 41.836944,    longitude: -87.684722)
    static let fmf =        Association(name: "FMF",        regionCode: "AR",       latitude: 19.409444,    longitude: -99.130833)
        // CAF
    static let caf =        Association(name: "CAF",        regionCode: "CAF",      latitude: 29.938126,    longitude: 30.91398)
        // OFC
    static let ofc =        Association(name: "OFC",        regionCode: "COC",      latitude: -36.840556,   longitude: 174.74)
        // AFC
    static let afc =        Association(name: "AFC",        regionCode: "CAS",      latitude: 3.056296,     longitude: 101.688919)
    static let ffa =        Association(name: "FFA",        regionCode: "AU",       latitude: -33.865,      longitude: 151.209444)
    static let qfa =        Association(name: "QFA",        regionCode: "QA",       latitude: 25.3,         longitude: 51.516667)
    static let uaefa =      Association(name: "UAEFA",      regionCode: "AE",       latitude: 25.263056,    longitude: 55.297222)
    static let ffiri =      Association(name: "FFIRI",      regionCode: "IR",       latitude: 35.683333,    longitude: 51.416667)
    static let saff =       Association(name: "SAFF",       regionCode: "SA",       latitude: 24.633333,    longitude: 46.716667)
    static let cfa =        Association(name: "CFA",        regionCode: "CN",       latitude: 39.916667,    longitude: 116.383333)
    static let kfa =        Association(name: "KFA",        regionCode: "KR",       latitude: 37.55,        longitude: 126.966667)
    static let jfa =        Association(name: "JFA",        regionCode: "JP",       latitude: 35.683333,    longitude: 139.766667)
}
