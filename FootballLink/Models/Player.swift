//
//  Player.swift
//  FootballLink
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation

struct Player {
    let name: String
    let regionCode: String

    private var path: String {
        return name
            .replacingOccurrences(of: " ", with: "_")
            // `-` を置換
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
    }

    var url: String {
        return "https://en.wikipedia.org/wiki/\(path)#Career_statistics"
    }
}

extension Player {

    static let all = [
        Player(name: "Lionel Messi",        regionCode: "AR"),
        Player(name: "Cristiano Ronaldo",   regionCode: "PT"),
        Player(name: "Luis Suárez",         regionCode: "UY"),
        Player(name: "Robert Lewandowski",  regionCode: "PL"),
        Player(name: "Sergio Agüero",       regionCode: "AR"),
        Player(name: "Neymar",              regionCode: "BR"),
        Player(name: "Gonzalo Higuaín",     regionCode: "AR"),
        Player(name: "Zlatan Ibrahimović",  regionCode: "SE"),
        Player(name: "Wayne Rooney",        regionCode: "GB-ENG"),
        Player(name: "David Villa",         regionCode: "ES"),
        Player(name: "Samuel Eto'o",        regionCode: "CM"),
        Player(name: "Robbie Keane",        regionCode: "IE"),
        Player(name: "Robin van Persie",    regionCode: "NL"),
        Player(name: "Klaas-Jan Huntelaar", regionCode: "NL"),
        Player(name: "Carlos Tevez",        regionCode: "AR"),
        Player(name: "Mauro Icardi",        regionCode: "AR"),
        Player(name: "Edinson Cavani",      regionCode: "UY"),
        Player(name: "Edin Džeko",          regionCode: "BA"),
        Player(name: "Harry Kane",          regionCode: "GB-ENG"),
        Player(name: "Karim Benzema",       regionCode: "FR"),
        Player(name: "Antoine Griezmann",   regionCode: "FR"),
        Player(name: "Kylian Mbappé",       regionCode: "FR"),
        Player(name: "Paulo Dybala",        regionCode: "AR")
    ]

    static let teemplates = [
        Player(name: "", regionCode: ""),
        Player(name: "", regionCode: "")
    ]
}
