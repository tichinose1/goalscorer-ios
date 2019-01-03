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

    func loadFavoriteTopScorers() -> [String] {
        guard let data = UserDefaults.standard.topScorers else {
            return []
        }

        return try! JSONDecoder().decode([String].self, from: data)
    }

    func saveFavoriteTopScorers(topScorers: [String]) {
        let data = try! JSONEncoder().encode(topScorers)

        UserDefaults.standard.topScorers = data
    }
}

extension UserDefaults {
    var topScorers: Data? {
        get { return data(forKey: #function) }
        set { set(newValue, forKey: #function) }
    }
}
