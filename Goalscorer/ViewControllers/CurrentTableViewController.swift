//
//  CurrentTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit

class CurrentTableViewController: UITableViewController {

    var items: [TopScorer] = {
        return TopScorer.all.filter { ["2018–19", "2018"].contains($0.season) }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource

extension CurrentTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentCell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.imageView?.image = createImage(code: item.competition.regionCode)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CurrentTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url)
    }
}
