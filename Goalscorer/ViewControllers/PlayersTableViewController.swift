//
//  PlayersTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import RealmSwift

class PlayersTableViewController: UITableViewController {

    private lazy var items = RealmDAO<Player>()
        .findAll()
        .sorted(byKeyPath: "order")

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        // 検索フィールドを常に表示する
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController

        definesPresentationContext = true
    }
}

// MARK: - Table view data source

extension PlayersTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        cell.textLabel?.text = item.name
        cell.imageView?.image = item.association.image
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PlayersTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url)
    }
}

// MARK: - UISearchResultsUpdating

extension PlayersTableViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { fatalError() }

        if searchText.isEmpty {
            items = RealmDAO<Player>().findAll()
        } else {
            items = RealmDAO<Player>().findAll().filter("name CONTAINS[c] '\(searchText)'")
        }

        // TODO: reloadDataしないようにしたい
        tableView.reloadData()
    }
}
