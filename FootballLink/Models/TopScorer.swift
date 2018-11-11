//
//  TopScorer.swift
//  FootbballLink
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation

struct TopScorer {
    let title: String
    let regionCode: String
    let header: String

    private var path: String {
        return title
            .replacingOccurrences(of: " ", with: "_")
            // `-` を置換
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
    }

    private var fragment: String {
        return header.replacingOccurrences(of: " ", with: "_")
    }

    var url: String {
        return "https://en.wikipedia.org/wiki/\(path)#\(fragment)"
    }
}

extension TopScorer {

    static let all = [
        TopScorer(title: "2018–19 UEFA Champions League",           regionCode:"EU",        header: "Top goalscorers"),
        TopScorer(title: "2018–19 UEFA Europa League",              regionCode:"EU",        header: "Top goalscorers"),
        TopScorer(title: "2018–19 La Liga",                         regionCode:"ES",        header: "Top goalscorers"),
        TopScorer(title: "2018–19 Premier League",                  regionCode:"GB-ENG",    header: "Top goalscorers"),
        TopScorer(title: "2018–19 Serie A",                         regionCode:"IT",        header: "Top goalscorers"),
        TopScorer(title: "2018–19 Bundesliga",                      regionCode:"DE",        header: "Top scorers"),
        TopScorer(title: "2018–19 Ligue 1",                         regionCode:"FR",        header: "Top goalscorers"),
        TopScorer(title: "2018–19 Primeira Liga",                   regionCode:"PT",        header: "Season summary"),
        TopScorer(title: "2018–19 Eredivisie",                      regionCode:"NL",        header: "Top scorers"),
        TopScorer(title: "2018–19 Belgian First Division A",        regionCode:"BE",        header: "Top scorers"),
        TopScorer(title: "2018–19 Austrian Football Bundesliga",    regionCode:"AT",        header: "Top scorers"),
        TopScorer(title: "2018 Campeonato Brasileiro Série A",      regionCode:"BR",        header: "Top scorers"),
        TopScorer(title: "2018–19 Argentine Primera División",      regionCode:"AR",        header: "Top goalscorers"),
        TopScorer(title: "2018 Major League Soccer season",         regionCode:"US",        header: "Goals"),
        TopScorer(title: "2018–19 Liga MX season",                  regionCode:"MX",        header: "Top goalscorers"),
        TopScorer(title: "2018 Chinese Super League",               regionCode:"CN",        header: "Top scorers"),
        TopScorer(title: "2018 K League 1",                         regionCode:"KR",        header: "Top scorers"),
        TopScorer(title: "2018 J1 League",                          regionCode:"JP",        header: "Top scorers")
    ]

    static let teemplates = [
        TopScorer(title: "", regionCode:"", header: ""),
        TopScorer(title: "", regionCode:"", header: "")
    ]
}
