//
//  GoalTableViewController.swift
//  FootbballLink
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit

class GoalTableViewController: UITableViewController {

    let items = [
        TopScorer(title: "2018–19 La Liga", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_La_Liga#Top_goalscorers"),
        TopScorer(title: "2018–19 Premier League", url: "https://en.wikipedia.org/wiki/2018%E2%80%9319_Premier_League#Top_scorers")
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
