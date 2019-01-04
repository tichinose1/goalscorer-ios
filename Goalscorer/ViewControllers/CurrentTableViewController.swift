//
//  CurrentTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit

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

    private var favorites: [Favorite] = []
    private lazy var topScorers: [TopScorer] = TopScorer.all.filter { ["2018–19", "2018"].contains($0.season) }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 通知をタップしてフォアグラウンドになった際にviewWillAppearが呼ばれないためアプリのフォアグラウンド復帰イベントに登録しておく
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableView), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateTableView()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentCell", for: indexPath)
        let topScorer: TopScorer = {
            switch section {
            case .favorites: return topScorers.first { $0.url == favorites[indexPath.row].url }!
            case .topScorers: return topScorers[indexPath.row]
            }
        }()
        cell.textLabel?.text = topScorer.title
        cell.imageView?.image = createImage(code: topScorer.competition.regionCode)
        // TODO: セルに更新通知を表示する
        if case .favorites = section, favorites[indexPath.row].updated {
            cell.accessoryType = .detailDisclosureButton
        } else {
            cell.accessoryType = .disclosureIndicator
        }

        return cell
    }
}

// MARK: - UITableViewDelegate

extension CurrentTableViewController {

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Favorite") { _, _, completion in
            let topScorer = self.topScorers[indexPath.row]
            LocalStorage.shared.createFavorite(url: topScorer.url, createdAt: Date())
            self.updateTableView()
            completion(true)
        }
        let removeAction = UIContextualAction(style: .destructive, title: "Remove Favorite") { _, _, completion in
            let favorite = self.favorites[indexPath.row]
            LocalStorage.shared.deleteFavorite(url: favorite.url)
            self.updateTableView()
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
        // いずれのセクションからタップされたか関係なく、favoritesの最終参照時刻を更新する
        let url: String = {
            switch Section(rawValue: indexPath.section)! {
            case .favorites: return favorites[indexPath.row].url
            case .topScorers: return topScorers[indexPath.row].url
            }
        }()
        LocalStorage.shared.updateFavorite(url: url, lastReadAt: Date())

        presentSafariViewController(url: url)
    }
}

// MARK: - Private functions

private extension CurrentTableViewController {

    @objc func updateTableView() {
        // topScorersは不変なのでfavoritesのみローカルから全取得する
        favorites = LocalStorage.shared.readFavorites()
        tableView.reloadData()
    }
}
