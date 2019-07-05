//
//  AllTimeTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/13.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import Firebase

class AllTimeTableViewController: UITableViewController {

    private var items: [QueryDocumentSnapshot] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        Firestore.firestore().collection("overall_scorers").getDocuments { snapshot, error in
            // TODO: エラー処理
            guard let documents = snapshot?.documents else { return }

            self.items = documents.sorted { ($0["order"] as! Int) < ($1["order"] as! Int) }
            self.tableView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setScreenName("Alltime")
    }
}

// MARK: - UITableViewDataSource

extension AllTimeTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "allTimeCell", for: indexPath)

        let competitionRef = item["competition_ref"] as! DocumentReference
        competitionRef.getDocument { snapshot, error in
            // TODO: エラー処理
            guard let snapshot = snapshot else { return }

            let associationRef = snapshot["association_ref"] as! DocumentReference
            associationRef.getDocument { snapshot, error in
                // TODO: エラー処理
                guard let snapshot = snapshot else { return }

                let regionCode = snapshot["region_code"] as! String
                cell.imageView?.image = regionCode.image
            }

            let name = snapshot["name"] as! String
            cell.textLabel?.text = name
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AllTimeTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let url = item["url"] as! String
        presentSafariViewController(url: url, contentType: "overall_scorer", itemID: nil)
    }
}
