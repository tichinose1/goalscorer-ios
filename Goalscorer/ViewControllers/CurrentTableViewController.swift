//
//  CurrentTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import TDBadgedCell
import RealmSwift

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

    private lazy var favorites = RealmDAO<FavoriteScorer>().findAll()
    private lazy var scorers = RealmDAO<Scorer>()
        .findAll()
        .filter("season IN {'2018', '2018–19', '2019'}")
        .sorted(by: [SortDescriptor(keyPath: "season", ascending: false),
                     SortDescriptor(keyPath: "competition.kind", ascending: true),
                     SortDescriptor(keyPath: "competition.order", ascending: true)])
    var notificationToken: NotificationToken?

    deinit {
        notificationToken?.invalidate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        notificationToken = favorites.observe { [weak self] changes in
            guard let self = self else { return }

            switch changes {
            case .initial:
                print("initial")
            case .update(_, let deletions, let insertions, let modifications):
                print("update")
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                          with: .automatic)
                self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                          with: .automatic)
                self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                          with: .automatic)
                self.tableView.endUpdates()
            case .error(let error):
                print(error.localizedDescription)
            }

            UIApplication.shared.applicationIconBadgeNumber = self.favorites.filter { $0.updated }.count
        }
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
            case .favorites: return favorites[indexPath.row].updated ? "1" : ""
            case .scorers: return ""
            }
        }()

        let scorer: Scorer = {
            switch section {
            case .favorites: return favorites[indexPath.row].scorer
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
            if case .none = scorer.favorite {
                // scorerにfavoriteが1件も関連づいていない場合のみ追加する
                let favorite = FavoriteScorer()
                favorite.scorer = scorer
                RealmDAO<FavoriteScorer>().add(t: favorite)
            }
            completion(true)
        }
        let removeAction = UIContextualAction(style: .destructive, title: "Remove Favorite") { _, _, completion in
            let favorite = self.favorites[indexPath.row]
            RealmDAO<FavoriteScorer>().delete(t: favorite)
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
        let section = Section(rawValue: indexPath.section)!
        // いずれのセクションからタップされたか関係なく、favoritesの最終参照時刻を更新する
        let favorite: FavoriteScorer? = {
            switch section {
            case .favorites: return favorites[indexPath.row]
            case .scorers: return scorers[indexPath.row].favorite
            }
        }()
        RealmDAO<FavoriteScorer>().update {
            favorite?.lastReadAt = Date()
        }

        let scorer: Scorer = {
            switch section {
            case .favorites: return favorites[indexPath.row].scorer
            case .scorers: return scorers[indexPath.row]
            }
        }()
        presentSafariViewController(url: scorer.url)
    }
}
