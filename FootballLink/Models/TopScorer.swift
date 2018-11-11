//
//  TopScorer.swift
//  FootbballLink
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation

struct TopScorer {
    let season: String
    let competition: Competition
    let header: String

    var title: String {
        return "\(season) \(competition.name)"
    }

    var url: String {
        return "https://en.wikipedia.org/wiki/\(path)#\(fragment)"
    }
}

private extension TopScorer {

    var path: String {
        return title
            .replacingOccurrences(of: " ", with: "_")
            // `-` を置換
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
    }

    var fragment: String {
        return header.replacingOccurrences(of: " ", with: "_")
    }
}

extension TopScorer {

    static let all = [
        TopScorer(season: "2018–19",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .bundesliga,                   header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .ligue1,                       header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .primeiraLiga,                 header: "Season summary"),
        TopScorer(season: "2018–19",    competition: .eredivisie,                   header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .belgianFirstDivisionA,        header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .austrianFootballBundesliga,   header: "Top scorers"),
        TopScorer(season: "2018",       competition: .campeonatoBrasileiroSerieA,   header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .argentinePrimeraDivision,     header: "Top goalscorers"),
        TopScorer(season: "2018",       competition: .majorLeagueSoccer,            header: "Goals"),
        TopScorer(season: "2018–19",    competition: .ligaMX,                       header: "Top goalscorers"),
        TopScorer(season: "2018",       competition: .chineseSuperLeague,           header: "Top scorers"),
        TopScorer(season: "2018",       competition: .kLeague1,                     header: "Top scorers"),
        TopScorer(season: "2018",       competition: .j1League,                     header: "Top scorers"),
    ]
}
