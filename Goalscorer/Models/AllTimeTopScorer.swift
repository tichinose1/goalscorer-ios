//
//  AllTimeTopScorer.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/13.
//  Copyright © 2018 example.com. All rights reserved.
//

struct AllTimeTopScorer {
    let competition: Competition
    let url: String
}

extension AllTimeTopScorer {

    // swiftlint:disable all
    static let all = [
        // National competitions
        AllTimeTopScorer(competition: .fifaWorldCup, url: "https://en.wikipedia.org/wiki/FIFA_World_Cup_top_goalscorers#Overall_top_goalscorers"),
        AllTimeTopScorer(competition: .uefaEuro, url: "https://en.wikipedia.org/wiki/List_of_UEFA_European_Championship_goalscorers#Overall_top_goalscorers"),
        AllTimeTopScorer(competition: .copaAmerica, url: "https://en.wikipedia.org/wiki/Copa_Am%C3%A9rica_records_and_statistics#Goalscoring"),
        AllTimeTopScorer(competition: .concacafGoldCup, url: "https://en.wikipedia.org/wiki/CONCACAF_Gold_Cup_records_and_statistics#Top_20_goal_leaders"),
        AllTimeTopScorer(competition: .africaCupOfNations, url: "https://en.wikipedia.org/wiki/Africa_Cup_of_Nations_records_and_statistics#Overall_top_goalscorers"),
        AllTimeTopScorer(competition: .ofcNationsCup, url: "https://en.wikipedia.org/wiki/OFC_Nations_Cup_records_and_statistics#Overall_top_goalscorers"),
        AllTimeTopScorer(competition: .afcAsiaCup, url: "https://en.wikipedia.org/wiki/AFC_Asian_Cup_records_and_statistics#Overall_top_goalscorers"),
        // Club competitions
        AllTimeTopScorer(competition: .fifaClubWorldCup, url: "https://en.wikipedia.org/wiki/List_of_FIFA_Club_World_Cup_goalscorers#Overall_top_goalscorers"),
        AllTimeTopScorer(competition: .uefaChampionsLeague, url: "https://en.wikipedia.org/wiki/List_of_European_Cup_and_UEFA_Champions_League_top_scorers#All-time_top_scorers"),
        AllTimeTopScorer(competition: .copaLibertadores, url: "https://en.wikipedia.org/wiki/Copa_Libertadores_records_and_statistics#All-time_top_scorers"),
        AllTimeTopScorer(competition: .concacafChampionsLeague, url: "https://en.wikipedia.org/wiki/CONCACAF_Champions%27_Cup_and_Champions_League_records_and_statistics#All-time_top_scorers"),
        AllTimeTopScorer(competition: .ofcChampionsLeague, url: "https://en.wikipedia.org/wiki/Oceania_Club_Championship_and_OFC_Champions_League_records_and_statistics#All-time_top_scorers"),
        AllTimeTopScorer(competition: .afcChampionsLeague, url: "https://en.wikipedia.org/wiki/Asian_Club_Championship_and_AFC_Champions_League_records_and_statistics#All-time_top_goalscorers"),
        // League
        AllTimeTopScorer(competition: .laLiga, url: "https://en.wikipedia.org/wiki/List_of_La_Liga_top_scorers#All-time_top_scorers"),
        AllTimeTopScorer(competition: .premierLeague, url: "https://en.wikipedia.org/wiki/List_of_Premier_League_players_with_100_or_more_goals#Players"),
        AllTimeTopScorer(competition: .serieA, url: "https://en.wikipedia.org/wiki/List_of_Serie_A_players_with_100_or_more_goals#List"),
        AllTimeTopScorer(competition: .bundesliga, url: "https://en.wikipedia.org/wiki/Bundesliga#Top_scorers"),
        AllTimeTopScorer(competition: .ligue1, url: "https://en.wikipedia.org/wiki/List_of_Ligue_1_records_and_statistics#Goalscorers"),
        AllTimeTopScorer(competition: .campeonatoBrasileiroSerieA, url: "https://en.wikipedia.org/wiki/Campeonato_Brasileiro_S%C3%A9rie_A_top_scorers#All-time_top_scorers"),
        AllTimeTopScorer(competition: .argentinePrimeraDivision, url: "https://en.wikipedia.org/wiki/List_of_Argentine_Primera_Divisi%C3%B3n_top_scorers#All-time_Topscorers"),
        AllTimeTopScorer(competition: .j1League, url: "https://en.wikipedia.org/wiki/J.League_records_and_statistics#Ranks")
    ]
}
