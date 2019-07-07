//
//  RegionTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import Firebase

class AssociationTableViewController: UITableViewController {

    static func instantiate(association: DocumentSnapshot, competitions: [QueryDocumentSnapshot]) -> AssociationTableViewController {
        let vc = UIStoryboard(name: "Association", bundle: nil).instantiateInitialViewController() as! AssociationTableViewController
        vc.association = association
        vc.competitions = competitions
        return vc
    }

    private var association: DocumentSnapshot!
    private var competitions: [QueryDocumentSnapshot]!

    private var itemsArray: [[QueryDocumentSnapshot]]!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = association["name"] as! String

        itemsArray = competitions.map { _ in [QueryDocumentSnapshot]() }

        competitions.enumerated().forEach { index, snapshot in
            Firestore.firestore().collection("scorers").whereField("competition_ref", isEqualTo: snapshot.reference).addSnapshotListener { snapshot, error in
                print("snapshot?.metadata.isFromCache: \(snapshot?.metadata.isFromCache)")
                // TODO: エラー処理
                guard let documents = snapshot?.documents else { return }

                self.itemsArray[index] = documents.sorted { ($0["season"] as! String) > ($1["season"] as! String) }
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setScreenName("Association")
    }
}

// MARK: - UITableViewDataSource

extension AssociationTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return itemsArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let items = itemsArray[section]
        return items.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let competition = competitions[section]
        return competition["name"] as! String
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemsArray[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath)

        cell.textLabel?.text = item["title"] as! String

        let regionCode = association["region_code"] as! String
        cell.imageView?.image = regionCode.image

        return cell
    }
}

// MARK: - UITableViewDelegate

extension AssociationTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemsArray[indexPath.section][indexPath.row]
        let url = item["url"] as! String
        presentSafariViewController(url: url, contentType: "scorer", itemID: nil)
    }
}
