//
//  RegionTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import RealmSwift

class AssociationTableViewController: UITableViewController {

    static func instantiate(association: Association) -> AssociationTableViewController {
        let vc = UIStoryboard(name: "Association", bundle: nil).instantiateInitialViewController() as! AssociationTableViewController
        vc.association = association
        return vc
    }

    var association: Association!
    private lazy var items: [Scorer] = association!.competitions
        .flatMap { $0.scorers.sorted(byKeyPath: "season", ascending: false) }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = association.name
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setScreenName("Association")
    }
}

// MARK: - UITableViewDataSource

extension AssociationTableViewController {

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.imageView?.image = item.competition.association.image
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AssociationTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url, contentType: "scorer", itemID: item.title)
    }
}
