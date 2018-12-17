//
//  Competition.swift
//  Goalscorers
//
//  Created by tichinose1 on 2018/11/11.
//  Copyright © 2018 example.com. All rights reserved.
//

struct Competition: Comparable {
    let name: String
    let regionCode: String

    static func < (lhs: Competition, rhs: Competition) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Competition {

    // swiftlint:disable all
    static let fifaWorldCup =               Competition(name: "FIFA World Cup",                 regionCode: "LGBT")
    static let copaAmerica =                Competition(name: "Copa América",                   regionCode: "LGBT")
    static let uefaEuro =                   Competition(name: "UEFA Euro",                      regionCode: "LGBT")
    static let uefaChampionsLeague =        Competition(name: "UEFA Champions League",          regionCode: "LGBT")
    static let uefaEuropaLeague =           Competition(name: "UEFA Europa League",             regionCode: "LGBT")
    static let laLiga =                     Competition(name: "La Liga",                        regionCode: "ES")
    static let premierLeague =              Competition(name: "Premier League",                 regionCode: "GB-ENG")
    static let serieA =                     Competition(name: "Serie A",                        regionCode: "IT")
    static let bundesliga =                 Competition(name: "Bundesliga",                     regionCode: "DE")
    static let ligue1 =                     Competition(name: "Ligue 1",                        regionCode: "FR")
    static let primeiraLiga =               Competition(name: "Primeira Liga",                  regionCode: "PT")
    static let eredivisie =                 Competition(name: "Eredivisie",                     regionCode: "NL")
    static let belgianFirstDivisionA =      Competition(name: "Belgian First Division A",       regionCode: "BE")
    static let austrianFootballBundesliga = Competition(name: "Austrian Football Bundesliga",   regionCode: "AT")
    static let copaLibertadores =           Competition(name: "Copa Libertadores",              regionCode: "LGBT")
    static let campeonatoBrasileiroSerieA = Competition(name: "Campeonato Brasileiro Série A",  regionCode: "BR")
    static let argentinePrimeraDivision =   Competition(name: "Argentine Primera División",     regionCode: "AR")
    static let majorLeagueSoccer =          Competition(name: "Major League Soccer season",     regionCode: "US")
    static let ligaMX =                     Competition(name: "Liga MX season",                 regionCode: "MX")
    static let chineseSuperLeague =         Competition(name: "Chinese Super League",           regionCode: "CN")
    static let kLeague1 =                   Competition(name: "K League 1",                     regionCode: "KR")
    static let j1League =                   Competition(name: "J1 League",                      regionCode: "JP")
}
