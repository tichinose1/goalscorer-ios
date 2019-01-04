//
//  WebAPI.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/03.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation

final class WebAPI {
    
    static let shared = WebAPI()

    private init() { }

    func checkUpdate(title: String, completionHandler: @escaping (Date?) -> Void) {
        let url = createURL(title: title)

        URLSession.shared.dataTask(with: url) { data, _, _ in
            let timestamp = self.readTimestamp(data: data)

            completionHandler(timestamp)
            }.resume()
    }
}

private extension WebAPI {

    func createURL(title: String) -> URL {
        var component = URLComponents(string: "https://en.wikipedia.org/w/api.php")!
        component.queryItems = [
            URLQueryItem(name: "action", value: "query"),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "prop", value: "revisions"),
            URLQueryItem(name: "titles", value: title),
            URLQueryItem(name: "rvlimit", value: "1")
        ]
        return component.url!
    }

    func readTimestamp(data: Data?) -> Date? {
        guard let data = data else { return nil }

        do {
            let wikipedia = try JSONDecoder.shared.decode(Wikipedia.self, from: data)

            return wikipedia.query.pages.first?.value.revisions.first?.timestamp
        } catch {
            print(error)
            return nil
        }
    }
}
