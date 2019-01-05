//
//  Player.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation

struct Player {
    let name: String
    let association: Association

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
        Player(name: "Lionel Messi", association: .argentina),
        Player(name: "Cristiano Ronaldo", association: .portugal),
        Player(name: "Luis Suárez", association: .uruguay),
        Player(name: "Robert Lewandowski", association: .poland),
        Player(name: "Harry Kane", association: .england),
        Player(name: "Sergio Agüero", association: .argentina),
        Player(name: "Pierre-Emerick Aubameyang", association: .gabon),
        Player(name: "Edinson Cavani", association: .uruguay),
        Player(name: "Gonzalo Higuaín", association: .argentina),
        Player(name: "Mohamed Salah", association: .egypt),
        Player(name: "Mauro Icardi", association: .argentina),
        Player(name: "Ciro Immobile", association: .italy),
        Player(name: "Edin Džeko", association: .bosniaAndHerzegovina),
        Player(name: "Romelu Lukaku", association: .belguim),
        Player(name: "Antoine Griezmann", association: .france),
        Player(name: "Neymar", association: .brazil),
        Player(name: "Kylian Mbappé", association: .france),
        Player(name: "Gareth Bale", association: .wales),
        Player(name: "Zlatan Ibrahimović", association: .sweden),
        Player(name: "Wayne Rooney", association: .england),
        Player(name: "David Villa", association: .spain),
        Player(name: "Samuel Eto'o", association: .cameroon),
        Player(name: "Robbie Keane", association: .ireland),
        Player(name: "Robin van Persie", association: .netherlands),
        Player(name: "Klaas-Jan Huntelaar", association: .netherlands),
        Player(name: "Carlos Tevez", association: .argentina),
        Player(name: "Karim Benzema", association: .france),
        Player(name: "Paulo Dybala", association: .argentina),
        Player(name: "Gabriel Jesus", association: .brazil),
        Player(name: "Andrej Kramarić", association: .croatia),
        Player(name: "Lorenzo Insigne", association: .italy),
        Player(name: "Moussa Marega", association: .mali),
        Player(name: "Moanes Dabour", association: .israel),
        Player(name: "Iago Aspas", association: .spain),
        Player(name: "Cristhian Stuani", association: .uruguay),
        Player(name: "André Silva (footballer, born 1995)", association: .portugal),
        Player(name: "Maxi Gómez", association: .uruguay),
        Player(name: "Wissam Ben Yedder", association: .france),
        Player(name: "Eden Hazard", association: .belguim),
        Player(name: "Richarlison", association: .brazil),
        Player(name: "Sadio Mané", association: .senegal),
        Player(name: "Anthony Martial", association: .france),
        Player(name: "Raheem Sterling", association: .england),
        Player(name: "Krzysztof Piątek", association: .poland),
        Player(name: "Dries Mertens", association: .belguim),
        Player(name: "Mario Mandžukić", association: .croatia),
        Player(name: "Luka Jović", association: .serbia),
        Player(name: "Paco Alcácer", association: .spain),
        Player(name: "Marco Reus", association: .germany),
        Player(name: "Timo Werner", association: .germany),
        Player(name: "Roberto Firmino", association: .brazil),
        Player(name: "Aritz Aduriz", association: .spain),
        Player(name: "Mario Balotelli", association: .italy),
        Player(name: "Jamie Vardy", association: .england),
        Player(name: "Alexandre Lacazette", association: .france),
        Player(name: "Riyad Mahrez", association: .algeria),
        Player(name: "Son Heung-min", association: .southKorea),
        Player(name: "Fabio Quagliarella", association: .italy),
        Player(name: "Giovanni Simeone", association: .argentina),
        Player(name: "Nils Petersen", association: .germany),
        Player(name: "Radamel Falcao", association: .colombia),
        Player(name: "Álvaro Morata", association: .spain),
        Player(name: "Sandro Ramírez", association: .spain),
        Player(name: "Alexis Sánchez", association: .chile),
        Player(name: "Diego Costa", association: .spain),
        Player(name: "Dele Alli", association: .england),
        Player(name: "Andrea Belotti", association: .italy),
        Player(name: "Marco Borriello", association: .italy),
        Player(name: "Anthony Modeste (footballer, born 1988)", association: .france),
        Player(name: "Mario Gómez", association: .germany),
        Player(name: "Arjen Robben", association: .netherlands),
        Player(name: "Franck Ribéry", association: .france),
        Player(name: "Vedad Ibišević", association: .bosniaAndHerzegovina),
        Player(name: "Javier Hernández", association: .mexico),
        Player(name: "Olivier Giroud", association: .france),
        Player(name: "Thomas Müller", association: .germany)
    ]
}
