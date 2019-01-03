//
//  CurrentTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import SwipeCellKit

class CurrentTableViewController: UITableViewController {

    private lazy var favorites: [String] = LocalStorage.shared.loadFavoriteTopScorers()

    private lazy var items: [TopScorer] = TopScorer.all.filter { ["2018–19", "2018"].contains($0.season) }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - SwipeTableViewCellDelegate

extension CurrentTableViewController: SwipeTableViewCellDelegate {

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let addAction = SwipeAction(style: .default, title: "Favorite") { action, indexPath in
            self.favorites.append(self.items[indexPath.row].url)
            self.tableView.reloadData()
            LocalStorage.shared.saveFavoriteTopScorers(topScorers: self.favorites)
        }
        addAction.backgroundColor = view.tintColor

        let deleteAction = SwipeAction(style: .destructive, title: "Remove Favorite") { action, indexPath in
            switch indexPath.section {
            case 0: self.favorites.remove(at: indexPath.row)
            case 1: self.favorites = self.favorites.filter { $0 != self.items[indexPath.row].url }
            default: fatalError()
            }
            self.tableView.reloadData()
            LocalStorage.shared.saveFavoriteTopScorers(topScorers: self.favorites)
        }

        switch indexPath.section {
        case 0: return [deleteAction]
        case 1: return favorites.contains(items[indexPath.row].url) ? [deleteAction] : [addAction]
        default: fatalError()
        }
    }
}

// MARK: - UITableViewDataSource

extension CurrentTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Favorites"
        case 1: return "Top scorers"
        default: fatalError()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return favorites.count
        case 1: return items.count
        default: fatalError()
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currentCell") as? SwipeTableViewCell else { fatalError() }
        cell.delegate = self

        let item: TopScorer = {
            switch indexPath.section {
            case 0: return items.first { $0.url == favorites[indexPath.row] }!
            case 1: return items[indexPath.row]
            default: fatalError()
            }
        }()

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
