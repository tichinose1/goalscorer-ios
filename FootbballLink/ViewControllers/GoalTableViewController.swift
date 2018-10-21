//
//  GoalTableViewController.swift
//  FootbballLink
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import FlagKit

class GoalTableViewController: UITableViewController {

    let items = [
        TopScorer(title: "2018–19 UEFA Champions League", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_UEFA_Champions_League#Top_goalscorers"),
        TopScorer(title: "2018–19 UEFA Europa League", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_UEFA_Europa_League#Top_goalscorers"),
        TopScorer(title: "2018–19 La Liga", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_La_Liga#Top_goalscorers"),
        TopScorer(title: "2018–19 Premier League", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Premier_League#Top_scorers"),
        TopScorer(title: "2018–19 Serie A", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Serie_A#Top_goalscorers"),
        TopScorer(title: "2018–19 Bundesliga", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Bundesliga#Top_scorers"),
        TopScorer(title: "2018–19 Ligue 1", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Ligue_1#Top_goalscorers"),
        TopScorer(title: "2018–19 Primeira Liga", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Primeira_Liga#Season_summary"),
        TopScorer(title: "2018–19 Eredivisie", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Eredivisie#Top_scorers"),
        TopScorer(title: "2018–19 Belgian First Division A", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Belgian_First_Division_A#Top_scorers"),
        TopScorer(title: "2018–19 Austrian Football Bundesliga", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Austrian_Football_Bundesliga#Top_scorers"),
        TopScorer(title: "2018 Campeonato Brasileiro Série A", url: "https://en.wikipedia.org/wiki/2018_Campeonato_Brasileiro_S%C3%A9rie_A#Top_scorers"),
        TopScorer(title: "2018–19 Argentine Primera División", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Argentine_Primera_Divisi%C3%B3n#Top_goalscorers"),
        TopScorer(title: "2018 Major League Soccer season", url: "https://en.wikipedia.org/wiki/2018_Major_League_Soccer_season#Goals"),
        TopScorer(title: "2018–19 Liga MX season", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Liga_MX_season#Top_goalscorers"),
        TopScorer(title: "2018 Chinese Super League", url: "https://en.wikipedia.org/wiki/2018_Chinese_Super_League#Top_scorers"),
        TopScorer(title: "2018 K League 1", url: "https://en.wikipedia.org/wiki/2018_K_League_1#Top_scorers"),
        TopScorer(title: "2018 J1 League", url: "https://en.wikipedia.org/wiki/2018_J1_League#Top_scorers")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Table view data source

extension GoalTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath)
        cell.textLabel?.text = item.title
        return cell
    }
}

// MARK: - UITableViewDelegate

extension GoalTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url)
    }
}
