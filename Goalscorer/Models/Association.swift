//
//  Association.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/31.
//  Copyright © 2018 example.com. All rights reserved.
//

import CoreLocation

struct Association {
    let coordinate: CLLocationCoordinate2D
    let competitions: [Competition]
}

extension Association {

    static let all = [
        // FIFA
        Association(coordinate: CLLocationCoordinate2D(latitude: 47.381389,     longitude: 8.574444),   competitions: [.fifaClubWorldCup, .fifaWorldCup]),
        // UEFA
        Association(coordinate: CLLocationCoordinate2D(latitude: 46.371009,     longitude: 6.23103),    competitions: [.uefaEuro, .uefaChampionsLeague, .uefaEuropaLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 40.383333,     longitude: -3.716667),  competitions: [.laLiga]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 51.5,          longitude: -0.116667),  competitions: [.premierLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 41.9,          longitude: 12.483333),  competitions: [.serieA]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 50.116667,     longitude: 8.683333),   competitions: [.bundesliga]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 48.8567,       longitude: 2.3508),     competitions: [.ligue1]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 55.75,         longitude: 37.616667),  competitions: [.russianPremierLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 38.713889,     longitude: -9.139444),  competitions: [.primeiraLiga]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 50.85,         longitude: 4.35),       competitions: [.belgianFirstDivisionA]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 50.45,         longitude: 30.523333),  competitions: [.ukrainianPremierLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 41.013611,     longitude: 28.955),     competitions: [.superLig]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 52.083333,     longitude: 5.233333),   competitions: [.eredivisie]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 48.2,          longitude: 16.366667),  competitions: [.austrianFootballBundesliga]),
        // CONMEBOL
        Association(coordinate: CLLocationCoordinate2D(latitude: -25.260556,    longitude: -57.516111), competitions: [.copaAmerica, .copaLibertadores]),
        Association(coordinate: CLLocationCoordinate2D(latitude: -22.908333,    longitude: -43.196389), competitions: [.campeonatoBrasileiroSerieA]),
        Association(coordinate: CLLocationCoordinate2D(latitude: -34.603333,    longitude: -58.381667), competitions: [.argentinePrimeraDivision]),
        // CONCACAF
        Association(coordinate: CLLocationCoordinate2D(latitude: 25.773,        longitude: -80.138),    competitions: [.concacafGoldCup, .concacafChampionsLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 41.836944,     longitude: -87.684722), competitions: [.majorLeagueSoccer]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 19.409444,     longitude: -99.130833), competitions: [.ligaMX]),
        // CAF
        Association(coordinate: CLLocationCoordinate2D(latitude: 29.938126,     longitude: 30.91398),   competitions: [.africaCupOfNations, .cafChampionsLeague]),
        // OFC
        Association(coordinate: CLLocationCoordinate2D(latitude: -36.840556,    longitude: 174.74),     competitions: [.ofcNationsCup, .ofcChampionsLeague]),
        // AFC
        Association(coordinate: CLLocationCoordinate2D(latitude: 3.056296,      longitude: 101.688919), competitions: [.afcAsiaCup, .afcChampionsLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: -33.865,       longitude: 151.209444), competitions: [.aLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 25.3,          longitude: 51.516667),  competitions: [.qatarStarsLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 25.263056,     longitude: 55.297222),  competitions: [.uaeProLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 35.683333,     longitude: 51.416667),  competitions: [.persianGulfProLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 24.633333,     longitude: 46.716667),  competitions: [.saudiProfessionalLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 39.916667,     longitude: 116.383333), competitions: [.chineseSuperLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 37.55,         longitude: 126.966667), competitions: [.kLeague1]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 35.683333,     longitude: 139.766667), competitions: [.j1League])
    ]
}
