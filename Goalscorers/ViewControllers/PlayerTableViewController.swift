//
//  PlayerTableViewController.swift
//  Goalscorers
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import FlagKit

class PlayerTableViewController: UITableViewController {

    var items: [Player] = []

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

        items = Player.all
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

// MARK: - UISearchResultsUpdating

extension PlayerTableViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { fatalError() }

        // TODO: I wanna remove "if"
        if searchText == "" {
            items = Player.all
        } else {
            items = Player.all.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }

        tableView.reloadData()
    }
}
