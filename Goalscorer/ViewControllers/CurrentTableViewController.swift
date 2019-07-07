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

    private var favorites: [QueryDocumentSnapshot] = []
    private var scorers: [QueryDocumentSnapshot] = []

//    private lazy var favorites = RealmDAO<FavoriteScorer>().findAll()
//    private lazy var scorers = RealmDAO<Scorer>()
//        .findAll()
//        .filter("season IN {'2018', '2018–19', '2019'}")
//        .sorted(by: [SortDescriptor(keyPath: "season", ascending: false),
//                     SortDescriptor(keyPath: "competition.kind", ascending: true),
//                     SortDescriptor(keyPath: "competition.order", ascending: true)])
//    var notificationToken: NotificationToken?

//    deinit {
//        notificationToken?.invalidate()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        notificationToken = favorites.observe { [weak self] changes in
//            guard let self = self else { return }
//
//            switch changes {
//            case .initial:
//                print("initial")
//            case .update(_, let deletions, let insertions, let modifications):
//                print("update")
//                self.tableView.beginUpdates()
//                self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
//                                          with: .automatic)
//                self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
//                                          with: .automatic)
//                self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
//                                          with: .automatic)
//                self.tableView.endUpdates()
//            case .error(let error):
//                print(error.localizedDescription)
//            }
//
//            UIApplication.shared.applicationIconBadgeNumber = self.favorites.filter { $0.updated }.count
//        }

        Firestore.firestore().collection("scorers").whereField("season", isGreaterThan: "2018").addSnapshotListener { snapshot, error in
            print("snapshot?.metadata.isFromCache: \(snapshot?.metadata.isFromCache)")
            // TODO: エラー処理
            guard let documents = snapshot?.documents else { return }

            self.scorers = documents.sorted { ($0["order"] as! Int) > ($1["order"] as! Int) }
            self.tableView.reloadData()
        }

        Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).collection("favorite_scorers").addSnapshotListener { snapshot, error in
            print("snapshot?.metadata.isFromCache: \(snapshot?.metadata.isFromCache)")
            // TODO: エラー処理
            guard let documents = snapshot?.documents else { return }
            // TODO: updated_atが無い場合は未来の日付にしておくべき？
            self.favorites = documents.sorted { ($0["updated_at"] as? Timestamp)?.dateValue() ?? Date() < ($1["updated_at"] as? Timestamp)?.dateValue() ?? Date() }
            self.tableView.reloadData()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currentCell") as? TDBadgedCell else { fatalError() }
        // TODO: セルに更新通知を表示する→サーバ側でやるべき？
//        cell.badgeColor = .red
//        cell.badgeString = {
//            switch section {
//            case .favorites: return favorites[indexPath.row].updated ? "1" : ""
//            case .scorers: return ""
//            }
//        }()
        let section = Section(rawValue: indexPath.section)!
        switch section {
        case .favorites:
            let item = favorites[indexPath.row]
            updateCell(cell: cell, favorite: item)
        case .scorers:
            let item = scorers[indexPath.row]
            updateCell(cell: cell, scorer: item)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CurrentTableViewController {

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Favorite") { _, _, completion in
            let scorer = self.scorers[indexPath.row]
            // TODO: 多重追加チェックはサーバ側でやらないといけない
            Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).collection("favorite_scorers").document().setData([
                "scorer_ref": scorer.reference,
                "created_at": FieldValue.serverTimestamp(),
                "updated_at": FieldValue.serverTimestamp()
            ]) { error in
                // TODO: エラー処理
            }
            completion(true)
        }
        let removeAction = UIContextualAction(style: .destructive, title: "Remove Favorite") { _, _, completion in
            let favorite = self.favorites[indexPath.row]
            favorite.reference.delete { error in
                // TODO: エラー処理
            }
            completion(true)
        }
        let section = Section(rawValue: indexPath.section)!
        let actions: [UIContextualAction] = {
            switch section {
            case .favorites: return [removeAction]
            case .scorers: return [addAction]
            }
        }()
        return UISwipeActionsConfiguration(actions: actions)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = Section(rawValue: indexPath.section)!
        // いずれのセクションからタップされたか関係なく、favoritesの最終参照時刻を更新する
        // TODO: この機能が必要か再考
//        let favorite: DocumentSnapshot? = {
//            switch section {
//            case .favorites:
//                return favorites[indexPath.row]
//            case .scorers:
//                let item = scorers[indexPath.row]
//                // TODO: クライアントでの存在チェック
//                return favorites.first { ($0["scorer_ref"] as! DocumentReference).documentID == item.documentID }
//            }
//        } ()
//        favorite?.reference.setData([
//            "last_read_at": FieldValue.serverTimestamp()
//        ]) { error in
//            // TODO: エラー処理
//        }

        switch section {
        case .favorites:
            let item = favorites[indexPath.row]
            let scorerRef = item["scorer_ref"] as! DocumentReference
            scorerRef.getDocument { snapshot, error in
                print("snapshot?.metadata.isFromCache: \(snapshot?.metadata.isFromCache)")
                // TODO: エラー処理
                guard let snapshot = snapshot else { return }

                let url = snapshot["url"] as! String
                self.presentSafariViewController(url: url, contentType: "scorers", itemID: nil)
            }
        case .scorers:
            let item = scorers[indexPath.row]
            let url = item["url"] as! String
            presentSafariViewController(url: url, contentType: "scorers", itemID: nil)
        }
    }
}

private extension CurrentTableViewController {

    func updateCell(cell: UITableViewCell, favorite: DocumentSnapshot) {
        let scorerRef = favorite["scorer_ref"] as! DocumentReference
        scorerRef.getDocument { snapshot, error in
            print("snapshot?.metadata.isFromCache: \(snapshot?.metadata.isFromCache)")
            // TODO: エラー処理
            guard let snapshot = snapshot else { return }

            self.updateCell(cell: cell, scorer: snapshot)
        }
    }

    func updateCell(cell: UITableViewCell, scorer: DocumentSnapshot) {
        let title = scorer["title"] as! String
        cell.textLabel?.text = title

        let competitionRef = scorer["competition_ref"] as! DocumentReference
        competitionRef.getDocument { snapshot, error in
            print("snapshot?.metadata.isFromCache: \(snapshot?.metadata.isFromCache)")
            // TODO: エラー処理
            guard let snapshot = snapshot else { return }

            let associationRef = snapshot["association_ref"] as! DocumentReference
            associationRef.getDocument { snapshot, error in
                print("snapshot?.metadata.isFromCache: \(snapshot?.metadata.isFromCache)")
                // TODO: エラー処理
                guard let snapshot = snapshot else { return }

                let regionCode = snapshot["region_code"] as! String
                cell.imageView?.image = regionCode.image
            }
        }
    }
}
