//
//  Extensions.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import SafariServices
import FirebaseAnalytics

extension UIViewController {

    func presentSafariViewController(url: String, contentType: String, itemID: String?) {
        if let itemID = itemID {
            // select_contentの場合、content_typeとitem_idしかダッシュボードで使えないようなので、コンテンツ名をitem_idで指定する
            Analytics.logEvent(AnalyticsEventSelectContent, parameters: [AnalyticsParameterItemID: itemID,
                                                                         AnalyticsParameterContentType: contentType])
        }

        guard let url = URL(string: url) else { fatalError() }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true) {
        }
    }

    func setScreenName(_ screenName: String) {
        Analytics.setScreenName(screenName, screenClass: classForCoder.description())
    }
}

import UIKit
import FlagKit

extension String {

    var image: UIImage? {
        switch self {
        case "CAF", "CAS", "CEU", "CNA", "COC", "CSA", "WW":
            return UIImage(named: self)
        default:
            return Flag(countryCode: self)?.image(style: .roundedRect)
        }
    }
}
