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

    private var items: [OverallScorerPlain] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        Firestore.firestore().collection("overall_scorers").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            self.items = documents
                .compactMap { document in
                    let competitionRef = document["competitionRef"] as! DocumentReference
                    if let competition = GlobalData.shared.findCompetition(competitionID: competitionRef.documentID) {
                        return OverallScorerPlain(data: document, competition: competition)
                    } else {
                        print("\(document["url"] as! String)'s competiton is not found.")
                        return nil
                    }
                }
                .sorted {
                    $0.competition.order < $1.competition.order
                }
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
        cell.textLabel?.text = item.competition.name
        cell.imageView?.image = item.competition.association.image
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AllTimeTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url, contentType: "overall_scorer", itemID: item.competition.name)
    }
}
