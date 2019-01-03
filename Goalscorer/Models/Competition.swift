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
    static let fifaWorldCup =               Competition(name: "FIFA World Cup",                 regionCode: "WW")
    static let uefaEuro =                   Competition(name: "UEFA Euro",                      regionCode: "CEU")
    static let copaAmerica =                Competition(name: "Copa América",                   regionCode: "CSA")
    static let concacafGoldCup =            Competition(name: "CONCACAF Gold Cup",              regionCode: "CNA")
    static let africaCupOfNations =         Competition(name: "Africa Cup of Nations",          regionCode: "CAF")
    static let ofcNationsCup =              Competition(name: "OFC Nations Cup",                regionCode: "COC")
    static let afcAsiaCup =                 Competition(name: "AFC Asian Cup",                  regionCode: "CAS")
    // Club competitions
    static let fifaClubWorldCup =           Competition(name: "FIFA Club World Cup",            regionCode: "WW")
    static let uefaChampionsLeague =        Competition(name: "UEFA Champions League",          regionCode: "CEU")
    static let uefaEuropaLeague =           Competition(name: "UEFA Europa League",             regionCode: "CEU")
    static let copaLibertadores =           Competition(name: "Copa Libertadores",              regionCode: "CSA")
    static let concacafChampionsLeague =    Competition(name: "CONCACAF Champions League",      regionCode: "CNA")
    static let cafChampionsLeague =         Competition(name: "CAF Champions League",           regionCode: "CAF")
    static let afcChampionsLeague =         Competition(name: "AFC Champions League",           regionCode: "CAS")
    static let ofcChampionsLeague =         Competition(name: "OFC Champions League",           regionCode: "COC")
    // UEFA
    static let laLiga =                     Competition(name: "La Liga",                        regionCode: "ES")
    static let premierLeague =              Competition(name: "Premier League",                 regionCode: "GB-ENG")
    static let serieA =                     Competition(name: "Serie A",                        regionCode: "IT")
    static let bundesliga =                 Competition(name: "Bundesliga",                     regionCode: "DE")
    static let ligue1 =                     Competition(name: "Ligue 1",                        regionCode: "FR")
    static let russianPremierLeague =       Competition(name: "Russian Premier League",         regionCode: "RU")
    static let primeiraLiga =               Competition(name: "Primeira Liga",                  regionCode: "PT")
    static let belgianFirstDivisionA =      Competition(name: "Belgian First Division A",       regionCode: "BE")
    static let ukrainianPremierLeague =     Competition(name: "Ukrainian Premier League",       regionCode: "UA")
    static let superLig =                   Competition(name: "Süper Lig",                      regionCode: "TR")
    static let eredivisie =                 Competition(name: "Eredivisie",                     regionCode: "NL")
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
