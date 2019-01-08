//
//  WebAPI.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/03.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// TODO: rename
final class WebAPI {
    
    // TODO: rename
    func getWikipedia(title: String) -> Single<Wikipedia> {
        let urlRequest = buildURLRequest(title: title)
        return URLSession.shared.rx
            .data(request: urlRequest)
            .map { try JSONDecoder.shared.decode(Wikipedia.self, from: $0) }
            .asSingle()
    }
}

private extension WebAPI {

    func buildURLRequest(title: String) -> URLRequest {
        var component = URLComponents(string: "https://en.wikipedia.org/w/api.php")!
        component.queryItems = [
            URLQueryItem(name: "action", value: "query"),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "prop", value: "revisions"),
            URLQueryItem(name: "titles", value: title),
            URLQueryItem(name: "rvlimit", value: "1")
        ]
        return URLRequest(url: component.url!)
    }
}
