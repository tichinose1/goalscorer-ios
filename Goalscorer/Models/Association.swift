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
        Association(coordinate: CLLocationCoordinate2D(latitude: 47.381389, longitude: 8.574444), competitions: [.fifaWorldCup]),
        Association(coordinate: CLLocationCoordinate2D(latitude: -25.260556, longitude: -57.516111), competitions: [.copaAmerica, .copaLibertadores]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 46.371009, longitude: 6.23103), competitions: [.uefaEuro, .uefaChampionsLeague, .uefaEuropaLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 40.433333, longitude: -3.7), competitions: [.laLiga]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.116667), competitions: [.premierLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.483333), competitions: [.serieA]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 52.516667, longitude: 13.383333), competitions: [.bundesliga]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 48.85, longitude: 2.35), competitions: [.ligue1]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 38.766667, longitude: -9.15), competitions: [.primeiraLiga]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 52.366667, longitude: 4.883333), competitions: [.eredivisie]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 50.85, longitude: 4.35), competitions: [.belgianFirstDivisionA]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 48.2, longitude: 16.35), competitions: [.austrianFootballBundesliga]),
        Association(coordinate: CLLocationCoordinate2D(latitude: -15.783333, longitude: -47.866667), competitions: [.campeonatoBrasileiroSerieA]),
        Association(coordinate: CLLocationCoordinate2D(latitude: -34.6, longitude: -58.383333), competitions: [.argentinePrimeraDivision]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 38.883333, longitude: -77.016667), competitions: [.majorLeagueSoccer]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 19.433333, longitude: -99.133333), competitions: [.ligaMX]),
        Association(coordinate: CLLocationCoordinate2D(latitude: -35.308056, longitude: 149.124444), competitions: [.aLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 25.3, longitude: 51.516667), competitions: [.qatarStarsLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 24.466667, longitude: 54.366667), competitions: [.uaeProLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 35.683333, longitude: 51.416667), competitions: [.persianGulfProLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 24.65, longitude: 46.766667), competitions: [.saudiProfessionalLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 39.916667, longitude: 116.383333), competitions: [.chineseSuperLeague]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 37.55, longitude: 126.966667), competitions: [.kLeague1]),
        Association(coordinate: CLLocationCoordinate2D(latitude: 35.683333, longitude: 139.766667), competitions: [.j1League])
    ]
}
