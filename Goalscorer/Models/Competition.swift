//
//  Competition.swift
//  Goalscorer
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
    // National competitions
    static let fifaWorldCup =               Competition(name: "FIFA World Cup",                 regionCode: "fifa")
    static let uefaEuro =                   Competition(name: "UEFA Euro",                      regionCode: "uefa")
    static let copaAmerica =                Competition(name: "Copa América",                   regionCode: "conmebol")
    static let concacafGoldCup =            Competition(name: "CONCACAF Gold Cup",              regionCode: "concacaf")
    static let africaCupOfNations =         Competition(name: "Africa Cup of Nations",          regionCode: "caf")
    static let ofcNationsCup =              Competition(name: "OFC Nations Cup",                regionCode: "ofc")
    static let afcAsiaCup =                 Competition(name: "AFC Asian Cup",                  regionCode: "afc")
    // Club competitions
    static let fifaClubWorldCup =           Competition(name: "FIFA Club World Cup",            regionCode: "fifa")
    static let uefaChampionsLeague =        Competition(name: "UEFA Champions League",          regionCode: "uefa")
    static let uefaEuropaLeague =           Competition(name: "UEFA Europa League",             regionCode: "uefa")
    static let copaLibertadores =           Competition(name: "Copa Libertadores",              regionCode: "conmebol")
    static let concacafChampionsLeague =    Competition(name: "CONCACAF Champions League",      regionCode: "concacaf")
    static let cafChampionsLeague =         Competition(name: "CAF Champions League",           regionCode: "caf")
    static let afcChampionsLeague =         Competition(name: "AFC Champions League",           regionCode: "afc")
    static let ofcChampionsLeague =         Competition(name: "OFC Champions League",           regionCode: "ofc")
    // UEFA
    static let laLiga =                     Competition(name: "La Liga",                        regionCode: "ES")
    static let premierLeague =              Competition(name: "Premier League",                 regionCode: "GB-ENG")
    static let serieA =                     Competition(name: "Serie A",                        regionCode: "IT")
    static let bundesliga =                 Competition(name: "Bundesliga",                     regionCode: "DE")
    static let ligue1 =                     Competition(name: "Ligue 1",                        regionCode: "FR")
    static let primeiraLiga =               Competition(name: "Primeira Liga",                  regionCode: "PT")
    static let eredivisie =                 Competition(name: "Eredivisie",                     regionCode: "NL")
    static let belgianFirstDivisionA =      Competition(name: "Belgian First Division A",       regionCode: "BE")
    static let austrianFootballBundesliga = Competition(name: "Austrian Football Bundesliga",   regionCode: "AT")
    // CONMEBOL
    static let campeonatoBrasileiroSerieA = Competition(name: "Campeonato Brasileiro Série A",  regionCode: "BR")
    static let argentinePrimeraDivision =   Competition(name: "Argentine Primera División",     regionCode: "AR")
    // CONCACAF
    static let majorLeagueSoccer =          Competition(name: "Major League Soccer season",     regionCode: "US")
    static let ligaMX =                     Competition(name: "Liga MX season",                 regionCode: "MX")
    // AFC
    static let aLeague =                    Competition(name: "A-League",                       regionCode: "AU")
    static let qatarStarsLeague =           Competition(name: "Qatar Stars League",             regionCode: "QA")
    static let uaeProLeague =               Competition(name: "UAE Pro-League",                 regionCode: "AE")
    static let persianGulfProLeague =       Competition(name: "Persian Gulf Pro League",        regionCode: "IR")
    static let saudiProfessionalLeague =    Competition(name: "Saudi Professional League",      regionCode: "SA")
    static let chineseSuperLeague =         Competition(name: "Chinese Super League",           regionCode: "CN")
    static let kLeague1 =                   Competition(name: "K League 1",                     regionCode: "KR")
    static let j1League =                   Competition(name: "J1 League",                      regionCode: "JP")
}
