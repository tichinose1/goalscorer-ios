//
//  Extensions.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {

    func presentSafariViewController(url: String) {
        print("url: \(url)")

        guard let url = URL(string: url) else { fatalError() }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true) {
        }
    }
}

extension JSONDecoder {

    static let shared: JSONDecoder = {
        var decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

extension JSONEncoder {

    static let shared: JSONEncoder = {
        var encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }()
}
