//
//  CurrentTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit

class CurrentTableViewController: UITableViewController {

    private var favorites: [Favorite] = []
    private lazy var items: [TopScorer] = TopScorer.all.filter { ["2018–19", "2018"].contains($0.season) }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(updateTableView), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateTableView()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentCell", for: indexPath)

        let item: TopScorer = {
            switch indexPath.section {
            case 0: return items.first { $0.url == favorites[indexPath.row].url }!
            case 1: return items[indexPath.row]
            default: fatalError()
            }
        }()

        cell.textLabel?.text = item.title
        cell.imageView?.image = createImage(code: item.competition.regionCode)

        if let favorite = LocalStorage.shared.readFavorite(url: item.url), favorite.updated {
            cell.accessoryType = .detailDisclosureButton
        } else {
            cell.accessoryType = .disclosureIndicator
        }

        return cell
    }
}

// MARK: - UITableViewDelegate

extension CurrentTableViewController {

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Favorite") { action, view, completionHandler in
            let item = self.items[indexPath.row]
            LocalStorage.shared.createFavorite(url: item.url)
            self.updateTableView()
            completionHandler(true)
        }
        let deleteAction = UIContextualAction(style: .destructive, title: "Remove Favorite") { action, view, completionHandler in
            let favorite = self.favorites[indexPath.row]
            LocalStorage.shared.deleteFavorite(url: favorite.url)
            self.updateTableView()
            completionHandler(true)
        }
        let actions: [UIContextualAction] = {
            switch indexPath.section {
            case 0: return [deleteAction]
            case 1: return [addAction]
            default: fatalError()
            }
        }()

        return UISwipeActionsConfiguration(actions: actions)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url: String = {
            switch indexPath.section {
            case 0: return favorites[indexPath.row].url
            case 1: return items[indexPath.row].url
            default: fatalError()
            }
        }()
        LocalStorage.shared.updateFavorite(url: url, lastReadAt: Date())

        presentSafariViewController(url: url)
    }
}

private extension CurrentTableViewController {

    @objc func updateTableView() {
        favorites = LocalStorage.shared.readFavorites()
        tableView.reloadData()
    }
}
