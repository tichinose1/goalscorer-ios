//
//  AllTimeTableViewController.swift
//  Goalscorers
//
//  Created by tichinose1 on 2018/11/13.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import FlagKit

class AllTimeTableViewController: UITableViewController {

    var items = AllTimeTopScorers.all

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource

extension AllTimeTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "allTimeCell", for: indexPath)
        cell.textLabel?.text = item.competition.name
        cell.imageView?.image = Flag(countryCode: item.competition.regionCode)?.originalImage
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AllTimeTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url)
    }
}
