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
    // ソート済み
    private var originalItems: [PlayerPlain] = []
    private var items: [PlayerPlain] = []

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

        Firestore.firestore().collection("players").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            self.originalItems = documents
                .map { document in
                    let associationRef = document["associationRef"] as! DocumentReference
                    let association = GlobalData.shared.findAssociation(associationID: associationRef.documentID)
                    return PlayerPlain(data: document, association: association)
                }
                .sorted {
                    $0.order < $1.order
                }
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
        cell.textLabel?.text = item.name
        cell.imageView?.image = item.association.image
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PlayersTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url, contentType: "player", itemID: item.name)
    }
}

// MARK: - UISearchResultsUpdating

extension PlayersTableViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { fatalError() }

        // TODO: リファクタリング
        items = searchText.isEmpty
            ? self.originalItems
            : self.originalItems.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
}
