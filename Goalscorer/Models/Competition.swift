//
//  Competition.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/11.
//  Copyright © 2018 example.com. All rights reserved.
//

struct Competition {
    let name: String
    let association: Association
}

extension Competition: Comparable {

    static func < (lhs: Competition, rhs: Competition) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Competition: Codable {
}

extension Competition {

    static let all: [Competition] = [.fifaWorldCup, .uefaEuro, .copaAmerica, .concacafGoldCup, .africaCupOfNations, .ofcNationsCup, .afcAsiaCup,
                                     .fifaClubWorldCup, .uefaChampionsLeague, .uefaEuropaLeague, .copaLibertadores, .concacafChampionsLeague, .cafChampionsLeague, .afcChampionsLeague, .ofcChampionsLeague,
                                     .laLiga, .premierLeague, .serieA, .bundesliga, .ligue1, .russianPremierLeague, .primeiraLiga, .belgianFirstDivisionA, .ukrainianPremierLeague, .superLig, .eredivisie, .austrianFootballBundesliga,
                                     .campeonatoBrasileiroSerieA, .argentinePrimeraDivision,
                                     .majorLeagueSoccer, .ligaMX,
                                     .aLeague, .qatarStarsLeague, .uaeProLeague, .persianGulfProLeague, .saudiProfessionalLeague, .chineseSuperLeague, .kLeague1, .j1League]

    // swiftlint:disable all
    // National competitions
    static let fifaWorldCup =               Competition(name: "FIFA World Cup",                 association: .fifa)
    static let uefaEuro =                   Competition(name: "UEFA Euro",                      association: .uefa)
    static let copaAmerica =                Competition(name: "Copa América",                   association: .conmebol)
    static let concacafGoldCup =            Competition(name: "CONCACAF Gold Cup",              association: .concacaf)
    static let africaCupOfNations =         Competition(name: "Africa Cup of Nations",          association: .caf)
    static let ofcNationsCup =              Competition(name: "OFC Nations Cup",                association: .ofc)
    static let afcAsiaCup =                 Competition(name: "AFC Asian Cup",                  association: .afc)
    // Club competitions
    static let fifaClubWorldCup =           Competition(name: "FIFA Club World Cup",            association: .fifa)
    static let uefaChampionsLeague =        Competition(name: "UEFA Champions League",          association: .uefa)
    static let uefaEuropaLeague =           Competition(name: "UEFA Europa League",             association: .uefa)
    static let copaLibertadores =           Competition(name: "Copa Libertadores",              association: .conmebol)
    static let concacafChampionsLeague =    Competition(name: "CONCACAF Champions League",      association: .concacaf)
    static let cafChampionsLeague =         Competition(name: "CAF Champions League",           association: .caf)
    static let afcChampionsLeague =         Competition(name: "AFC Champions League",           association: .afc)
    static let ofcChampionsLeague =         Competition(name: "OFC Champions League",           association: .ofc)
    // UEFA
    static let laLiga =                     Competition(name: "La Liga",                        association: .spain)
    static let premierLeague =              Competition(name: "Premier League",                 association: .england)
    static let serieA =                     Competition(name: "Serie A",                        association: .italy)
    static let bundesliga =                 Competition(name: "Bundesliga",                     association: .germany)
    static let ligue1 =                     Competition(name: "Ligue 1",                        association: .france)
    static let russianPremierLeague =       Competition(name: "Russian Premier League",         association: .russia)
    static let primeiraLiga =               Competition(name: "Primeira Liga",                  association: .portugal)
    static let belgianFirstDivisionA =      Competition(name: "Belgian First Division A",       association: .belguim)
    static let ukrainianPremierLeague =     Competition(name: "Ukrainian Premier League",       association: .ukraine)
    static let superLig =                   Competition(name: "Süper Lig",                      association: .turkey)
    static let eredivisie =                 Competition(name: "Eredivisie",                     association: .netherlands)
    static let austrianFootballBundesliga = Competition(name: "Austrian Football Bundesliga",   association: .austria)
    // CONMEBOL
    static let campeonatoBrasileiroSerieA = Competition(name: "Campeonato Brasileiro Série A",  association: .brazil)
    static let argentinePrimeraDivision =   Competition(name: "Argentine Primera División",     association: .argentina)
    // CONCACAF
    static let majorLeagueSoccer =          Competition(name: "Major League Soccer season",     association: .unitedStates)
    static let ligaMX =                     Competition(name: "Liga MX season",                 association: .mexico)
    // AFC
    static let aLeague =                    Competition(name: "A-League",                       association: .australia)
    static let qatarStarsLeague =           Competition(name: "Qatar Stars League",             association: .qatar)
    static let uaeProLeague =               Competition(name: "UAE Pro-League",                 association: .unitedArabEmirates)
    static let persianGulfProLeague =       Competition(name: "Persian Gulf Pro League",        association: .iran)
    static let saudiProfessionalLeague =    Competition(name: "Saudi Professional League",      association: .saudiArabia)
    static let chineseSuperLeague =         Competition(name: "Chinese Super League",           association: .china)
    static let kLeague1 =                   Competition(name: "K League 1",                     association: .southKorea)
    static let j1League =                   Competition(name: "J1 League",                      association: .japan)
}
