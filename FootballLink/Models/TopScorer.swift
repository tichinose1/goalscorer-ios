//
//  TopScorer.swift
//  FootbballLink
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

struct TopScorer {
    let title: String
    let regionCode: String
    let url: String
}

extension TopScorer {

    static let all = [
        TopScorer(title: "2018–19 UEFA Champions League", regionCode:"EU", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_UEFA_Champions_League#Top_goalscorers"),
        TopScorer(title: "2018–19 UEFA Europa League", regionCode:"EU", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_UEFA_Europa_League#Top_goalscorers"),
        TopScorer(title: "2018–19 La Liga", regionCode:"ES", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_La_Liga#Top_goalscorers"),
        TopScorer(title: "2018–19 Premier League", regionCode:"GB-ENG", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Premier_League#Top_scorers"),
        TopScorer(title: "2018–19 Serie A", regionCode:"IT", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Serie_A#Top_goalscorers"),
        TopScorer(title: "2018–19 Bundesliga", regionCode:"DE", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Bundesliga#Top_scorers"),
        TopScorer(title: "2018–19 Ligue 1", regionCode:"FR", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Ligue_1#Top_goalscorers"),
        TopScorer(title: "2018–19 Primeira Liga", regionCode:"PT", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Primeira_Liga#Season_summary"),
        TopScorer(title: "2018–19 Eredivisie", regionCode:"NL", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Eredivisie#Top_scorers"),
        TopScorer(title: "2018–19 Belgian First Division A", regionCode:"BE", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Belgian_First_Division_A#Top_scorers"),
        TopScorer(title: "2018–19 Austrian Football Bundesliga", regionCode:"AT", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Austrian_Football_Bundesliga#Top_scorers"),
        TopScorer(title: "2018 Campeonato Brasileiro Série A", regionCode:"BR", url: "https://en.wikipedia.org/wiki/2018_Campeonato_Brasileiro_S%C3%A9rie_A#Top_scorers"),
        TopScorer(title: "2018–19 Argentine Primera División", regionCode:"AR", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Argentine_Primera_Divisi%C3%B3n#Top_goalscorers"),
        TopScorer(title: "2018 Major League Soccer season", regionCode:"US", url: "https://en.wikipedia.org/wiki/2018_Major_League_Soccer_season#Goals"),
        TopScorer(title: "2018–19 Liga MX season", regionCode:"MX", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Liga_MX_season#Top_goalscorers"),
        TopScorer(title: "2018 Chinese Super League", regionCode:"CN", url: "https://en.wikipedia.org/wiki/2018_Chinese_Super_League#Top_scorers"),
        TopScorer(title: "2018 K League 1", regionCode:"KR", url: "https://en.wikipedia.org/wiki/2018_K_League_1#Top_scorers"),
        TopScorer(title: "2018 J1 League", regionCode:"JP", url: "https://en.wikipedia.org/wiki/2018_J1_League#Top_scorers")
    ]

    static let teemplates = [
        TopScorer(title: "", regionCode:"", url: ""),
        TopScorer(title: "", regionCode:"", url: "")
    ]
}
