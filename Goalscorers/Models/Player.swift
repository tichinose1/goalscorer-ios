//
//  Player.swift
//  Goalscorers
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation

struct Player {
    let regionCode: String
    let name: String

    var url: String {
        return "https://en.wikipedia.org/wiki/\(path)#Career_statistics"
    }
}

private extension Player {

    private var path: String {
        return name
            .replacingOccurrences(of: " ", with: "_")
            // `-` を置換
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
    }
}

extension Player {

    // swiftlint:disable all
    static let all = [
        Player(regionCode: "AR",        name: "Lionel Messi"),
        Player(regionCode: "PT",        name: "Cristiano Ronaldo"),
        Player(regionCode: "UY",        name: "Luis Suárez"),
        Player(regionCode: "PL",        name: "Robert Lewandowski"),
        Player(regionCode: "GB-ENG",    name: "Harry Kane"),
        Player(regionCode: "AR",        name: "Sergio Agüero"),
        Player(regionCode: "GA",        name: "Pierre-Emerick Aubameyang"),
        Player(regionCode: "UY",        name: "Edinson Cavani"),
        Player(regionCode: "AR",        name: "Gonzalo Higuaín"),
        Player(regionCode: "EG",        name: "Mohamed Salah"),
        Player(regionCode: "AR",        name: "Mauro Icardi"),
        Player(regionCode: "IT",        name: "Ciro Immobile"),
        Player(regionCode: "BA",        name: "Edin Džeko"),
        Player(regionCode: "BE",        name: "Romelu Lukaku"),
        Player(regionCode: "FR",        name: "Antoine Griezmann"),
        Player(regionCode: "BR",        name: "Neymar"),
        Player(regionCode: "FR",        name: "Kylian Mbappé"),
        Player(regionCode: "GB-WLS",    name: "Gareth Bale"),
        Player(regionCode: "SE",        name: "Zlatan Ibrahimović"),
        Player(regionCode: "GB-ENG",    name: "Wayne Rooney"),
        Player(regionCode: "ES",        name: "David Villa"),
        Player(regionCode: "CM",        name: "Samuel Eto'o"),
        Player(regionCode: "IE",        name: "Robbie Keane"),
        Player(regionCode: "NL",        name: "Robin van Persie"),
        Player(regionCode: "NL",        name: "Klaas-Jan Huntelaar"),
        Player(regionCode: "AR",        name: "Carlos Tevez"),
        Player(regionCode: "FR",        name: "Karim Benzema"),
        Player(regionCode: "AR",        name: "Paulo Dybala"),
        Player(regionCode: "BR",        name: "Gabriel Jesus"),
        Player(regionCode: "HR",        name: "Andrej Kramarić"),
        Player(regionCode: "IT",        name: "Lorenzo Insigne"),
        Player(regionCode: "ML",        name: "Moussa Marega"),
        Player(regionCode: "IL",        name: "Moanes Dabour"),
        Player(regionCode: "ES",        name: "Iago Aspas"),
        Player(regionCode: "UY",        name: "Cristhian Stuani"),
        Player(regionCode: "PT",        name: "André Silva (footballer, born 1995)"),
        Player(regionCode: "UY",        name: "Maxi Gómez"),
        Player(regionCode: "FR",        name: "Wissam Ben Yedder"),
        Player(regionCode: "BE",        name: "Eden Hazard"),
        Player(regionCode: "BR",        name: "Richarlison"),
        Player(regionCode: "SN",        name: "Sadio Mané"),
        Player(regionCode: "FR",        name: "Anthony Martial"),
        Player(regionCode: "GB-ENG",    name: "Raheem Sterling"),
        Player(regionCode: "PL",        name: "Krzysztof Piątek"),
        Player(regionCode: "BE",        name: "Dries Mertens"),
        Player(regionCode: "HR",        name: "Mario Mandžukić"),
        Player(regionCode: "RS",        name: "Luka Jović"),
        Player(regionCode: "ES",        name: "Paco Alcácer"),
        Player(regionCode: "DE",        name: "Marco Reus"),
        Player(regionCode: "DE",        name: "Timo Werner"),
        Player(regionCode: "BR",        name: "Roberto Firmino"),
        Player(regionCode: "ES",        name: "Aritz Aduriz"),
        Player(regionCode: "IT",        name: "Mario Balotelli"),
        Player(regionCode: "GB-ENG",    name: "Jamie Vardy"),
        Player(regionCode: "FR",        name: "Alexandre Lacazette"),
        Player(regionCode: "DZ",        name: "Riyad Mahrez"),
        Player(regionCode: "KR",        name: "Son Heung-min"),
        Player(regionCode: "IT",        name: "Fabio Quagliarella"),
        Player(regionCode: "AR",        name: "Giovanni Simeone"),
        Player(regionCode: "DE",        name: "Nils Petersen"),
        Player(regionCode: "CO",        name: "Radamel Falcao"),
        Player(regionCode: "ES",        name: "Álvaro Morata"),
        Player(regionCode: "ES",        name: "Sandro Ramírez"),
        Player(regionCode: "CL",        name: "Alexis Sánchez"),
        Player(regionCode: "ES",        name: "Diego Costa"),
        Player(regionCode: "GB-ENG",    name: "Dele Alli"),
        Player(regionCode: "IT",        name: "Andrea Belotti"),
        Player(regionCode: "IT",        name: "Marco Borriello"),
        Player(regionCode: "FR",        name: "Anthony Modeste (footballer, born 1988)"),
        Player(regionCode: "DE",        name: "Mario Gómez"),
        Player(regionCode: "NL",        name: "Arjen Robben"),
        Player(regionCode: "FR",        name: "Franck Ribéry"),
        Player(regionCode: "BA",        name: "Vedad Ibišević"),
        Player(regionCode: "MX",        name: "Javier Hernández"),
        Player(regionCode: "FR",        name: "Olivier Giroud"),
        Player(regionCode: "DE",        name: "Thomas Müller")
    ]
}
