//
//  GoalTableViewController.swift
//  Goalscorers
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import FlagKit

private struct Section {
    let title: String
    let rows: [TopScorer]
}

class GoalTableViewController: UITableViewController {

    private var sections: [Section] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        updateDataSource(segmentIndex: 0)
    }

    @IBAction func didSelectSegmentedControl(_ sender: UISegmentedControl) {
        updateDataSource(segmentIndex: sender.selectedSegmentIndex)

        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension GoalTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.imageView?.image = Flag(countryCode: item.competition.regionCode)?.originalImage
        return cell
    }
}

// MARK: - UITableViewDelegate

extension GoalTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section].rows[indexPath.row]
        presentSafariViewController(url: item.url)
    }
}

// MARK: - Private functions

private extension GoalTableViewController {

    func updateDataSource(segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            sections = Dictionary(grouping: TopScorer.all) { $0.season }
                .map { Section(title: $0.key, rows: $0.value)}
                // グループ化のキーをソートする
                .sorted { $0.title > $1.title }
        case 1:
            // TODO: Competitionのソート
            sections = Dictionary(grouping: TopScorer.all) { $0.competition.name }
                .map { Section(title: $0.key, rows: $0.value )}
        default:
            fatalError()
        }
    }
}
