//
//  LocalStorage.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/03.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation

final class LocalStorage {

    static let shared = LocalStorage()

    private init() { }

    func createFavorite(url: String, lastReadAt: Date? = nil, lastUpdatedAt: Date? = nil) {
        var favorites = loadFavoriteTopScorers()
        if (favorites.contains { $0.url == url }) { return }

        let favorite = Favorite(url: url,
                                lastReadAt: lastReadAt,
                                lastUpdatedAt: lastUpdatedAt)
        favorites.append(favorite)
        LocalStorage.shared.saveFavoriteTopScorers(favorites: favorites)
    }

    func readFavorite(url: String) -> Favorite? {
        return loadFavoriteTopScorers().first { $0.url == url }
    }

    func readFavorites() -> [Favorite] {
        return loadFavoriteTopScorers()
    }

    func updateFavorite(url: String, lastReadAt: Date? = nil, lastUpdatedAt: Date? = nil) {
        let favorites = loadFavoriteTopScorers()
        let newFavorites: [Favorite] = favorites.map { f in
            f.url == url
                ? Favorite(url: f.url,
                           lastReadAt: lastReadAt ?? f.lastReadAt,
                           lastUpdatedAt: lastUpdatedAt ?? f.lastUpdatedAt)
                : f
        }
        saveFavoriteTopScorers(favorites: newFavorites)
    }

    func deleteFavorite(url: String) {
        let favorites = loadFavoriteTopScorers()
        let newFavorites = favorites.filter { $0.url != url }
        saveFavoriteTopScorers(favorites: newFavorites)
    }
}

private extension LocalStorage {

    func loadFavoriteTopScorers() -> [Favorite] {
        guard let data = UserDefaults.standard.topScorers else {
            return []
        }

        return try! JSONDecoder.shared.decode([Favorite].self, from: data)
    }

    func saveFavoriteTopScorers(favorites: [Favorite]) {
        let data = try! JSONEncoder.shared.encode(favorites)

        UserDefaults.standard.topScorers = data
    }
}

extension UserDefaults {
    var topScorers: Data? {
        get { return data(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
}
