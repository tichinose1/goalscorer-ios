//
//  UserDefaultsDAO.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/09.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation

final class UserDefaultsDAO {

    func loadFavoriteScorers() -> [FavoriteScorerPlain] {
        guard let data = UserDefaults.standard.favoriteScorers else {
            return []
        }

        do {
            return try JSONDecoder.shared.decode([FavoriteScorerPlain].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

    func saveFavoriteScorers(_ favoriteScorers: [FavoriteScorerPlain]) {
        do {
            let data = try JSONEncoder.shared.encode(favoriteScorers)

            UserDefaults.standard.favoriteScorers = data
        } catch {
            print(error.localizedDescription)
        }
    }
}
