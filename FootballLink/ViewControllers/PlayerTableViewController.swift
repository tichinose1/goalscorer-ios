//
//  PlayerTableViewController.swift
//  FootballLink
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import FlagKit

class PlayerTableViewController: UITableViewController {

    let items = Player.all

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Table view data source

extension PlayerTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        cell.textLabel?.text = item.name
        let flag = Flag(countryCode: item.regionCode)!
        let originalImage = flag.originalImage
        cell.imageView?.image = originalImage
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PlayerTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url)
    }
}
