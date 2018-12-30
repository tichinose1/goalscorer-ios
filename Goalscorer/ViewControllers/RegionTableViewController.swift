//
//  RegionTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit

class RegionTableViewController: UITableViewController {

    static func instantiate() -> RegionTableViewController {
        return UIStoryboard(name: "Region", bundle: nil).instantiateInitialViewController() as! RegionTableViewController
    }

    private var items: [TopScorer] = TopScorer.all

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource

extension RegionTableViewController {

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.imageView?.image = createImage(code: item.competition.regionCode)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension RegionTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url)
    }
}
