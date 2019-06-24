//
//  CurrentTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import TDBadgedCell
import Firebase

private enum Section: Int, CaseIterable {
    case favorites
    case scorers

    var header: String {
        switch self {
        case .favorites: return "Favorites"
        case .scorers: return "Scorers"
        }
    }
}

class CurrentTableViewController: UITableViewController {

    private lazy var favorites: [ScorerPlain] = []
    private lazy var scorers: [ScorerPlain] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        Firestore.firestore().collection("associations").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }

            GlobalData.shared.associations = documents.map { AssociationPlain(data: $0) }

            Firestore.firestore().collection("competitions").addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }

                GlobalData.shared.competitions = documents.map { document in
                    let associationRef = document["associationRef"] as! DocumentReference
                    let association = GlobalData.shared.findAssociation(associationID: associationRef.documentID)
                    return CompetitionPlain(data: document, association: association)
                }

                Firestore.firestore().collection("scorers").addSnapshotListener { snapshot, error in
                    guard let documents = snapshot?.documents else {
                        print("Error fetching documents: \(error!)")
                        return
                    }
                    self.scorers = documents.map { document in
                        let competitionRef = document["competitionRef"] as! DocumentReference
                        let competition = GlobalData.shared.findCompetition(competitionID: competitionRef.documentID)
                        return ScorerPlain(data: document, competition: competition)
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setScreenName("Current")
    }
}

// MARK: - UITableViewDataSource

extension CurrentTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Section(rawValue: section)!.header
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .favorites: return favorites.count
        case .scorers: return scorers.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Section(rawValue: indexPath.section)!

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currentCell") as? TDBadgedCell else {
            fatalError()
        }
        cell.badgeColor = .red
        // セルに更新通知を表示する
        cell.badgeString = {
            switch section {
            case .favorites: return ""
            case .scorers: return ""
            }
        }()

        let scorer: ScorerPlain = {
            switch section {
            case .favorites: return favorites[indexPath.row]
            case .scorers: return scorers[indexPath.row]
            }
        }()
        cell.textLabel?.text = scorer.title
        cell.imageView?.image = scorer.competition.association.image

        return cell
    }
}

// MARK: - UITableViewDelegate

extension CurrentTableViewController {

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Favorite") { _, _, completion in
            let scorer = self.scorers[indexPath.row]
//            if case .none = scorer.favorite {
//                // scorerにfavoriteが1件も関連づいていない場合のみ追加する
//                let favorite = FavoriteScorer()
//                favorite.scorer = scorer
//                RealmDAO<FavoriteScorer>().add(favorite)
//            }
            completion(true)
        }
        let removeAction = UIContextualAction(style: .destructive, title: "Remove Favorite") { _, _, completion in
//            let favorite = self.favorites[indexPath.row]
//            RealmDAO<FavoriteScorer>().delete(favorite)
            completion(true)
        }
        let actions: [UIContextualAction] = {
            switch Section(rawValue: indexPath.section)! {
            case .favorites: return [removeAction]
            case .scorers: return [addAction]
            }
        }()
        return UISwipeActionsConfiguration(actions: actions)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let section = Section(rawValue: indexPath.section)!
//        // いずれのセクションからタップされたか関係なく、favoritesの最終参照時刻を更新する
//        let favorite: FavoriteScorer? = {
//            switch section {
//            case .favorites: return favorites[indexPath.row]
//            case .scorers: return scorers[indexPath.row].favorite
//            }
//        }()
//        RealmDAO<FavoriteScorer>().update {
//            favorite?.lastReadAt = Date()
//        }
//
//        let scorer: Scorer = {
//            switch section {
//            case .favorites: return favorites[indexPath.row].scorer
//            case .scorers: return scorers[indexPath.row]
//            }
//        }()
//        presentSafariViewController(url: scorer.url, contentType: "scorer", itemID: scorer.title)
    }
}
