//
//  Functions.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import FlagKit

func createImage(code: String) -> UIImage? {
    switch code {
    case "fifa", "uefa", "conmebol":
        return UIImage(named: code)
    default:
        return Flag(countryCode: code)?.originalImage
    }
}
