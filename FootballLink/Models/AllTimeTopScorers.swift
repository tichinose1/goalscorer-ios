//
//  AllTimeTopScorers.swift
//  FootballLink
//
//  Created by tichinose1 on 2018/11/13.
//  Copyright © 2018 example.com. All rights reserved.
//

struct AllTimeTopScorers {
    let competition: Competition
    let url: String
}

extension AllTimeTopScorers {

    static let all = [
        AllTimeTopScorers(competition: .fifaWorldCup, url: "https://en.wikipedia.org/wiki/FIFA_World_Cup_top_goalscorers#Overall_top_goalscorers"),
        AllTimeTopScorers(competition: .copaAmerica, url: "https://en.wikipedia.org/wiki/Copa_Am%C3%A9rica_records_and_statistics#Goalscoring"),
        AllTimeTopScorers(competition: .uefaEuro, url: "https://en.wikipedia.org/wiki/List_of_UEFA_European_Championship_goalscorers#Overall_top_goalscorers"),
        AllTimeTopScorers(competition: .uefaChampionsLeague, url: "https://en.wikipedia.org/wiki/List_of_European_Cup_and_UEFA_Champions_League_top_scorers#All-time_top_scorers"),
        AllTimeTopScorers(competition: .laLiga, url: "https://en.wikipedia.org/wiki/List_of_La_Liga_top_scorers#All-time_top_scorers"),
        AllTimeTopScorers(competition: .premierLeague, url: "https://en.wikipedia.org/wiki/List_of_Premier_League_players_with_100_or_more_goals#Players"),
        AllTimeTopScorers(competition: .serieA, url: "https://en.wikipedia.org/wiki/List_of_Serie_A_players_with_100_or_more_goals#List"),
        AllTimeTopScorers(competition: .bundesliga, url: "https://en.wikipedia.org/wiki/Bundesliga#Top_scorers"),
        AllTimeTopScorers(competition: .campeonatoBrasileiroSerieA, url: "https://en.wikipedia.org/wiki/Campeonato_Brasileiro_S%C3%A9rie_A_top_scorers#All-time_top_scorers"),
        AllTimeTopScorers(competition: .argentinePrimeraDivision, url: "https://en.wikipedia.org/wiki/List_of_Argentine_Primera_Divisi%C3%B3n_top_scorers#All-time_Topscorers"),
        AllTimeTopScorers(competition: .j1League, url: "https://en.wikipedia.org/wiki/J.League_records_and_statistics#Ranks")
    ]
}
