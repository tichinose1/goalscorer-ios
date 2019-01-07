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
    case topScorers

    var header: String {
        switch self {
        case .favorites: return "Favorites"
        case .topScorers: return "Top scorers"
        }
    }
}

class CurrentTableViewController: UITableViewController {

    private lazy var favorites = LocalStorage<Favorite>().findAll()
    private lazy var topScorers = LocalStorage<TopScorer>().findAll().filter("season IN {'2019', '2018–19', '2018'}")

    override func viewDidLoad() {
        super.viewDidLoad()

        // 通知をタップしてフォアグラウンドになった際にviewWillAppearが呼ばれないためアプリのフォアグラウンド復帰イベントに登録しておく
        NotificationCenter.default.addObserver(self, selector: #selector(onAppForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
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
        case .topScorers: return topScorers.count
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
            case .topScorers: return ""
            }
        }()

        let topScorer: TopScorer = {
            switch section {
            case .favorites: return favorites[indexPath.row].topScorer
            case .topScorers: return topScorers[indexPath.row]
            }
        }()
        cell.textLabel?.text = topScorer.title
        cell.imageView?.image = createImage(code: topScorer.competition.association.regionCode)

        return cell
    }
}

// MARK: - UITableViewDelegate

extension CurrentTableViewController {

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Favorite") { _, _, completion in
            let topScorer = self.topScorers[indexPath.row]
            if case .none = topScorer.favorite {
                // topScorerにfavoriteが1件も関連づいていない場合のみ追加する
                let favorite = Favorite()
                favorite.topScorer = topScorer
                LocalStorage<Favorite>().add(t: favorite)
                self.tableView.reloadData()
            }
            completion(true)
        }
        let removeAction = UIContextualAction(style: .destructive, title: "Remove Favorite") { _, _, completion in
            let favorite = self.favorites[indexPath.row]
            LocalStorage<Favorite>().delete(t: favorite)
            self.tableView.reloadData()
            completion(true)
        }
        let actions: [UIContextualAction] = {
            switch Section(rawValue: indexPath.section)! {
            case .favorites: return [removeAction]
            case .topScorers: return [addAction]
            }
        }()
        return UISwipeActionsConfiguration(actions: actions)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = Section(rawValue: indexPath.section)!
        // いずれのセクションからタップされたか関係なく、favoritesの最終参照時刻を更新する
        let favorite: Favorite? = {
            switch section {
            case .favorites: return favorites[indexPath.row]
            case .topScorers: return topScorers[indexPath.row].favorite
            }
        }()
        LocalStorage<Favorite>().update {
            favorite?.lastReadAt = Date()
        }

        let topScorer: TopScorer = {
            switch section {
            case .favorites: return favorites[indexPath.row].topScorer
            case .topScorers: return topScorers[indexPath.row]
            }
        }()
        presentSafariViewController(url: topScorer.url)
    }
}

// MARK: - Private functions

private extension CurrentTableViewController {

    @objc func onAppForeground() {
        tableView.reloadData()
    }
}
