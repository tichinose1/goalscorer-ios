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

// MARK: - UITableViewSource

extension ByCompetitionTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "byCompetitionCell", for: indexPath)
        let flag = Flag(countryCode: item.regionCode)!
        let originalImage = flag.originalImage
        cell.imageView?.image = originalImage
        cell.textLabel?.text = item.name
        return cell
    }
}
