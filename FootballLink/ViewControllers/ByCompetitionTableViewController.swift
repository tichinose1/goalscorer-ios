//
//  ByCompetitionTableViewController.swift
//  FootballLink
//
//  Created by tichinose1 on 2018/11/12.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import FlagKit

class ByCompetitionTableViewController: UITableViewController {

    var items: [Competition] = [
        .fifaWorldCup,
        .uefaEuro,
        .uefaChampionsLeague,
        .uefaEuropaLeague,
        .laLiga,
        .premierLeague,
        .serieA,
        .bundesliga
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource

extension ByCompetitionTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "byCompetitionCell", for: indexPath)
        cell.imageView?.image = Flag(countryCode: item.regionCode)?.originalImage
        cell.textLabel?.text = item.name
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ByCompetitionTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]

        let vc = UIStoryboard(name: "Goal", bundle: nil).instantiateViewController(withIdentifier: "goalViewController") as! GoalTableViewController

        vc.items = TopScorer.all.filter { $0.competition == item }

        navigationController?.pushViewController(vc, animated: true)
    }
}
