//
//  PlayerTableViewController.swift
//  FootballLink
//
//  Created by tichinose1 on 2018/10/25.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import FlagKit

class PlayerTableViewController: UITableViewController {

    let items = [
        Player(name: "Lionel Messi", regionCode: "AR", url: "https://en.wikipedia.org/wiki/Lionel_Messi#Career_statistics"),
        Player(name: "Cristiano Ronaldo", regionCode: "PT", url: "https://en.wikipedia.org/wiki/Cristiano_Ronaldo#Career_statistics"),
        Player(name: "Luis Suárez", regionCode: "UY", url: "https://en.wikipedia.org/wiki/Luis_Su%C3%A1rez#Career_statistics"),
        Player(name: "Robert Lewandowski", regionCode: "PL", url: "https://en.wikipedia.org/wiki/Robert_Lewandowski#Career_statistics"),
        Player(name: "Sergio Agüero", regionCode: "AR", url: "https://en.wikipedia.org/wiki/Sergio_Ag%C3%BCero#Career_statistics"),
        Player(name: "Neymar", regionCode: "BR", url: "https://en.wikipedia.org/wiki/Neymar#Career_statistics"),
        Player(name: "Gonzalo Higuaín", regionCode: "AR", url: "https://en.wikipedia.org/wiki/Gonzalo_Higua%C3%ADn#Career_statistics"),
        Player(name: "Zlatan Ibrahimović", regionCode: "SE", url: "https://en.wikipedia.org/wiki/Zlatan_Ibrahimovi%C4%87#Career_statistics"),
        Player(name: "Wayne Rooney", regionCode: "GB-ENG", url: "https://en.wikipedia.org/wiki/Wayne_Rooney#Career_statistics"),
        Player(name: "David Villa", regionCode: "ES", url: "https://en.wikipedia.org/wiki/David_Villa#Career_statistics"),
        Player(name: "Samuel Eto'o", regionCode: "CM", url: "https://en.wikipedia.org/wiki/Samuel_Eto%27o#Career_statistics"),
        Player(name: "Robbie Keane", regionCode: "IE", url: "https://en.wikipedia.org/wiki/Robbie_Keane#Career_statistics"),
        Player(name: "Robin van Persie", regionCode: "NL", url: "https://en.wikipedia.org/wiki/Robin_van_Persie#Career_statistics"),
        Player(name: "Klaas-Jan Huntelaar", regionCode: "NL", url: "https://en.wikipedia.org/wiki/Klaas-Jan_Huntelaar#Career_statistics"),
        Player(name: "Carlos Tevez", regionCode: "AR", url: "https://en.wikipedia.org/wiki/Carlos_Tevez#Career_statistics"),
        Player(name: "Mauro Icardi", regionCode: "AR", url: "https://en.wikipedia.org/wiki/Mauro_Icardi#Career_statistics"),
        Player(name: "Edinson Cavani", regionCode: "UY", url: "https://en.wikipedia.org/wiki/Edinson_Cavani#Career_statistics"),
        Player(name: "Edin Džeko", regionCode: "BA", url: "https://en.wikipedia.org/wiki/Edin_D%C5%BEeko#Career_statistics"),
        Player(name: "Harry Kane", regionCode: "GB-ENG", url: "https://en.wikipedia.org/wiki/Harry_Kane#Career_statistics"),
        Player(name: "Karim Benzema", regionCode: "FR", url: "https://en.wikipedia.org/wiki/Karim_Benzema#Career_statistics"),
        Player(name: "Antoine Griezmann", regionCode: "FR", url: "https://en.wikipedia.org/wiki/Antoine_Griezmann#Career_statistics"),
        Player(name: "Kylian Mbappé", regionCode: "FR", url: "https://en.wikipedia.org/wiki/Kylian_Mbapp%C3%A9#Career_statistics"),
        Player(name: "Paulo Dybala", regionCode: "AR", url: "https://en.wikipedia.org/wiki/Paulo_Dybala#Career_statistics")
    ]
    let itemTemplates = [
        Player(name: "", regionCode: "", url: ""),
        Player(name: "", regionCode: "", url: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Table view data source

extension PlayerTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        cell.textLabel?.text = item.name
        let flag = Flag(countryCode: item.regionCode)!
        let originalImage = flag.originalImage
        cell.imageView?.image = originalImage
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PlayerTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url)
    }
}
