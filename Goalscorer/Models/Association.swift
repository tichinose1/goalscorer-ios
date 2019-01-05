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
    let latitude: Double
    let longitude: Double
    let competitions: [Competition]

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension Association {

    static let all = [
        // FIFA
        Association(name: "FIFA",       latitude: 47.381389,    longitude: 8.574444,    competitions: [.fifaClubWorldCup,
                                                                                                       .fifaWorldCup]),
        // UEFA
        Association(name: "UEFA",       latitude: 46.371009,    longitude: 6.23103,     competitions: [.uefaEuro,
                                                                                                       .uefaChampionsLeague,
                                                                                                       .uefaEuropaLeague]),
        Association(name: "RFEF",       latitude: 40.383333,    longitude: -3.716667,   competitions: [.laLiga]),
        Association(name: "FA",         latitude: 51.5,         longitude: -0.116667,   competitions: [.premierLeague]),
        Association(name: "FIGC",       latitude: 41.9,         longitude: 12.483333,   competitions: [.serieA]),
        Association(name: "DFB",        latitude: 50.116667,    longitude: 8.683333,    competitions: [.bundesliga]),
        Association(name: "FFF",        latitude: 48.8567,      longitude: 2.3508,      competitions: [.ligue1]),
        Association(name: "RFS",        latitude: 55.75,        longitude: 37.616667,   competitions: [.russianPremierLeague]),
        Association(name: "FPF",        latitude: 38.713889,    longitude: -9.139444,   competitions: [.primeiraLiga]),
        Association(name: "KBVB",       latitude: 50.85,        longitude: 4.35,        competitions: [.belgianFirstDivisionA]),
        Association(name: "FFU",        latitude: 50.45,        longitude: 30.523333,   competitions: [.ukrainianPremierLeague]),
        Association(name: "TFF",        latitude: 41.013611,    longitude: 28.955,      competitions: [.superLig]),
        Association(name: "KNVB",       latitude: 52.083333,    longitude: 5.233333,    competitions: [.eredivisie]),
        Association(name: "OFB",        latitude: 48.2,         longitude: 16.366667,   competitions: [.austrianFootballBundesliga]),
        // CONMEBOL
        Association(name: "CONMEBOL",   latitude: -25.260556,   longitude: -57.516111,  competitions: [.copaAmerica,
                                                                                                       .copaLibertadores]),
        Association(name: "CBF",        latitude: -22.908333,   longitude: -43.196389,  competitions: [.campeonatoBrasileiroSerieA]),
        Association(name: "AFA",        latitude: -34.603333,   longitude: -58.381667,  competitions: [.argentinePrimeraDivision]),
        // CONCACAF
        Association(name: "CONCACAF",   latitude: 25.773,       longitude: -80.138,     competitions: [.concacafGoldCup,
                                                                                                       .concacafChampionsLeague]),
        Association(name: "USSF",       latitude: 41.836944,    longitude: -87.684722,  competitions: [.majorLeagueSoccer]),
        Association(name: "FMF",        latitude: 19.409444,    longitude: -99.130833,  competitions: [.ligaMX]),
        // CAF
        Association(name: "CAF",        latitude: 29.938126,    longitude: 30.91398,    competitions: [.africaCupOfNations,
                                                                                                       .cafChampionsLeague]),
        // OFC
        Association(name: "OFC",        latitude: -36.840556,   longitude: 174.74,      competitions: [.ofcNationsCup,
                                                                                                       .ofcChampionsLeague]),
        // AFC
        Association(name: "AFC",        latitude: 3.056296,     longitude: 101.688919,  competitions: [.afcAsiaCup,
                                                                                                       .afcChampionsLeague]),
        Association(name: "FFA",        latitude: -33.865,      longitude: 151.209444,  competitions: [.aLeague]),
        Association(name: "QFA",        latitude: 25.3,         longitude: 51.516667,   competitions: [.qatarStarsLeague]),
        Association(name: "UAEFA",      latitude: 25.263056,    longitude: 55.297222,   competitions: [.uaeProLeague]),
        Association(name: "FFIRI",      latitude: 35.683333,    longitude: 51.416667,   competitions: [.persianGulfProLeague]),
        Association(name: "SAFF",       latitude: 24.633333,    longitude: 46.716667,   competitions: [.saudiProfessionalLeague]),
        Association(name: "CFA",        latitude: 39.916667,    longitude: 116.383333,  competitions: [.chineseSuperLeague]),
        Association(name: "KFA",        latitude: 37.55,        longitude: 126.966667,  competitions: [.kLeague1]),
        Association(name: "JFA",        latitude: 35.683333,    longitude: 139.766667,  competitions: [.j1League])
    ]
}
