//
//  PlayersTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import Firebase

class PlayersTableViewController: UITableViewController {

    private var originalItems: [QueryDocumentSnapshot] = []
    private var items: [QueryDocumentSnapshot] = []

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

        Firestore.firestore().collection("players").getDocuments { snapshot, error in
            // TODO: エラー処理
            guard let documents = snapshot?.documents else { return }

            self.originalItems = documents.sorted { ($0["order"] as! Int) < ($1["order"] as! Int) }
            self.items = self.originalItems
            self.tableView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setScreenName("Players")
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

        let associationRef = item["association_ref"] as! DocumentReference
        associationRef.getDocument { snapshot, error in
            // TODO: エラー処理
            guard let snapshot = snapshot else { return }

            let regionCode = snapshot["region_code"] as! String
            cell.imageView?.image = regionCode.image
        }

        let name = item["name"] as! String
        cell.textLabel?.text = name
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PlayersTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let url = item["url"] as! String
        presentSafariViewController(url: url, contentType: "player", itemID: nil)
    }
}

// MARK: - UISearchResultsUpdating

extension PlayersTableViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { fatalError() }
        // Resultsをクリアしたりマージしたりは出来ないようなので再取得してreloadDataする必要がありそう
        items = searchText.isEmpty
            ? originalItems
            : originalItems.filter { ($0["name"] as! String).lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
}
