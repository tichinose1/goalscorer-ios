//
//  TopScorer.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/10/22.
//  Copyright © 2018 example.com. All rights reserved.
//

import Foundation

struct TopScorer {
    let season: String
    let competition: Competition
    let header: String

    var title: String {
        // TODO: 特別扱いをやめたい
        if competition == .uefaEuro {
            return "\(competition.name) \(season)"
        } else if competition == .copaAmerica && season == "2016" {
            return "Copa América Centenario"
        }

        return "\(season) \(competition.name)"
    }

    var url: String {
        return "https://en.wikipedia.org/wiki/\(path)#\(fragment)"
    }
}

private extension TopScorer {

    var path: String {
        return title
            .replacingOccurrences(of: " ", with: "_")
            // `-` を置換
            .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
    }

    var fragment: String {
        return header.replacingOccurrences(of: " ", with: "_")
    }
}

extension TopScorer {

    // swiftlint:disable all
    static let all = [
        TopScorer(season: "2018–19",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .bundesliga,                   header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .ligue1,                       header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .primeiraLiga,                 header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .eredivisie,                   header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .belgianFirstDivisionA,        header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .austrianFootballBundesliga,   header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .cafChampionsLeague,           header: "Top goalscorers"),
        TopScorer(season: "2018",       competition: .copaLibertadores,             header: "Top scorers"),
        TopScorer(season: "2018",       competition: .concacafChampionsLeague,      header: "Top goalscorers"),
        TopScorer(season: "2018",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2018",       competition: .campeonatoBrasileiroSerieA,   header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .argentinePrimeraDivision,     header: "Top goalscorers"),
        TopScorer(season: "2018",       competition: .majorLeagueSoccer,            header: "Goals"),
        TopScorer(season: "2018–19",    competition: .ligaMX,                       header: "Top goalscorers"),
        TopScorer(season: "2018–19",    competition: .aLeague,                      header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .qatarStarsLeague,             header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .uaeProLeague,                 header: "Season statistics"),
        TopScorer(season: "2018–19",    competition: .persianGulfProLeague,         header: "Top scorers"),
        TopScorer(season: "2018–19",    competition: .saudiProfessionalLeague,      header: "Top scorers"),
        TopScorer(season: "2018",       competition: .chineseSuperLeague,           header: "Top scorers"),
        TopScorer(season: "2018",       competition: .kLeague1,                     header: "Top scorers"),
        TopScorer(season: "2018",       competition: .j1League,                     header: "Top scorers"),
        TopScorer(season: "2018",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2018",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "2017–18",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2017–18",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2017–18",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2017–18",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2017–18",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2017–18",    competition: .bundesliga,                   header: "Top scorers"),
        TopScorer(season: "2017",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2017",       competition: .copaLibertadores,             header: "Top scorers"),
        TopScorer(season: "2017",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2017",       competition: .concacafGoldCup,              header: "Goalscorers"),
        TopScorer(season: "2017",       competition: .africaCupOfNations,           header: "Goalscorers"),
        TopScorer(season: "2016–17",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2016–17",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2016–17",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2016–17",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2016–17",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2016–17",    competition: .bundesliga,                   header: "Top scorers"),
        TopScorer(season: "2016",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2016",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2016",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2016",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "2016",       competition: .copaAmerica,                  header: "Goalscorers"),
        TopScorer(season: "2015–16",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2015–16",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2015–16",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2015–16",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2015–16",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2015–16",    competition: .bundesliga,                   header: "Top goalscorers"),
        TopScorer(season: "2015",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2015",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2015",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2015",       competition: .copaAmerica,                  header: "Goalscorers"),
        TopScorer(season: "2015",       competition: .concacafGoldCup,              header: "Goalscorers"),
        TopScorer(season: "2015",       competition: .africaCupOfNations,           header: "Goalscorers"),
        TopScorer(season: "2015",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "2014–15",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2014–15",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2014–15",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2014–15",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2014–15",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2014–15",    competition: .bundesliga,                   header: "Top goalscorers"),
        TopScorer(season: "2014",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2014",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2014",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2014",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "2013–14",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2013–14",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2013–14",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2013–14",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2013–14",    competition: .serieA,                       header: "Top scorers"),
        TopScorer(season: "2013–14",    competition: .bundesliga,                   header: "Top scorers"),
        TopScorer(season: "2013",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2013",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2013",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2013",       competition: .concacafGoldCup,              header: "Goalscorers"),
        TopScorer(season: "2013",       competition: .africaCupOfNations,           header: "Goalscorers"),
        TopScorer(season: "2012–13",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2012–13",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2012–13",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2012–13",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2012–13",    competition: .serieA,                       header: "Top scorers"),
        TopScorer(season: "2012–13",    competition: .bundesliga,                   header: "Top scorers"),
        TopScorer(season: "2012",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2012",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2012",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2012",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "2012",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "2011–12",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2011–12",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2011–12",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2011–12",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2011–12",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2011–12",    competition: .bundesliga,                   header: "Top scorers"),
        TopScorer(season: "2011",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2011",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2011",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2011",       competition: .copaAmerica,                  header: "Goalscorers"),
        TopScorer(season: "2011",       competition: .concacafGoldCup,              header: "Goalscorers"),
        TopScorer(season: "2011",       competition: .afcAsiaCup,                   header: "Scorers"),
        TopScorer(season: "2010–11",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2010–11",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2010–11",    competition: .laLiga,                       header: "Top goalscorers"),
        TopScorer(season: "2010–11",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2010–11",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2010–11",    competition: .bundesliga,                   header: "Top scorers"),
        TopScorer(season: "2010",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2010",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2010",       competition: .afcChampionsLeague,           header: "Top scorers"),
        // TODO: リンクが想定外のパターン
        TopScorer(season: "2010",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "2010",       competition: .africaCupOfNations,           header: "Goalscorers"),
        TopScorer(season: "2009–10",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2009–10",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2009–10",    competition: .laLiga,                       header: "Pichichi Trophy"),
        TopScorer(season: "2009–10",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2009–10",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2009–10",    competition: .bundesliga,                   header: "Top scorers"),
        TopScorer(season: "2009",       competition: .fifaClubWorldCup,             header: "Scorers"),
        TopScorer(season: "2009",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2009",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2009",       competition: .concacafGoldCup,              header: "Goalscorers"),
        TopScorer(season: "2008–09",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2008–09",    competition: .uefaEuropaLeague,             header: "Top goalscorers"),
        TopScorer(season: "2008–09",    competition: .laLiga,                       header: "Pichichi Trophy"),
        TopScorer(season: "2008–09",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2008–09",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2008–09",    competition: .bundesliga,                   header: "Top goalscorers"),
        TopScorer(season: "2008",       competition: .fifaClubWorldCup,             header: "Scorers"),
        TopScorer(season: "2008",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2008",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2008",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "2008",       competition: .africaCupOfNations,           header: "Goalscorers"),
        TopScorer(season: "2007–08",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2007–08",    competition: .laLiga,                       header: "Pichichi Trophy"),
        TopScorer(season: "2007–08",    competition: .premierLeague,                header: "Top scorers"),
        TopScorer(season: "2007–08",    competition: .serieA,                       header: "Top goalscorers"),
        TopScorer(season: "2007–08",    competition: .bundesliga,                   header: "Top goalscorers"),
        TopScorer(season: "2007",       competition: .fifaClubWorldCup,             header: "Scorers"),
        TopScorer(season: "2007",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2007",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2007",       competition: .copaAmerica,                  header: "Goalscorers"),
        TopScorer(season: "2007",       competition: .concacafGoldCup,              header: "Goalscorers"),
        TopScorer(season: "2007",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "2006–07",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2006",       competition: .fifaClubWorldCup,             header: "Goalscorers"),
        TopScorer(season: "2006",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2006",       competition: .afcChampionsLeague,           header: "Top scorers"),
        TopScorer(season: "2006",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "2006",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "2005–06",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2005",       competition: .copaLibertadores,             header: "Top goalscorers"),
        TopScorer(season: "2005",       competition: .concacafGoldCup,              header: "Scorers"),
        TopScorer(season: "2004–05",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2004",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "2004",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "2004",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "2004",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "2003–04",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2003",       competition: .concacafGoldCup,              header: "Goalscorers"),
        TopScorer(season: "2002–03",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2002",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "2002",       competition: .concacafGoldCup,              header: "Top scorers"),
        TopScorer(season: "2002",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "2001–02",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2001",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "2000–01",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "2000",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "2000",       competition: .concacafGoldCup,              header: "Top scorers"),
        TopScorer(season: "2000",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "2000",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1999–2000",  competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "1999",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "1998–99",    competition: .uefaChampionsLeague,          header: "Top goalscorers"),
        TopScorer(season: "1998",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1998",       competition: .concacafGoldCup,              header: "Top scorers"),
        TopScorer(season: "1998",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1997",       competition: .copaAmerica,                  header: "Goalscorers"),
        TopScorer(season: "1996",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1996",       competition: .concacafGoldCup,              header: "Top scorers"),
        TopScorer(season: "1996",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1996",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1995",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "1994",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1994",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1993",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "1993",       competition: .concacafGoldCup,              header: "Top scorers"),
        TopScorer(season: "1992",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1992",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1992",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1991",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "1991",       competition: .concacafGoldCup,              header: "Goalscorers"),
        TopScorer(season: "1990",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1990",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1989",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "1988",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1988",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1988",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1987",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "1986",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1986",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1984",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1984",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1984",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1983",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "1982",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1982",       competition: .africaCupOfNations,           header: "Top scorers"),
        TopScorer(season: "1980",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1980",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1980",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1979",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "1978",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1978",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1976",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1976",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1976",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1975",       competition: .copaAmerica,                  header: "Goal scorers"),
        TopScorer(season: "1974",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1974",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1972",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1972",       competition: .africaCupOfNations,           header: "Goalscorers"),
        TopScorer(season: "1972",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1970",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1970",       competition: .africaCupOfNations,           header: "Goalscorers"),
        TopScorer(season: "1968",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1968",       competition: .africaCupOfNations,           header: "Goalscorers"),
        TopScorer(season: "1968",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1966",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1965",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1964",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1964",       competition: .afcAsiaCup,                   header: "Scorers"),
        TopScorer(season: "1963",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1962",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1962",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1960",       competition: .uefaEuro,                     header: "Goalscorers"),
        TopScorer(season: "1960",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1959",       competition: .africaCupOfNations,           header: "Scorers"),
        TopScorer(season: "1958",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1956",       competition: .afcAsiaCup,                   header: "Goalscorers"),
        TopScorer(season: "1954",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1950",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1938",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1934",       competition: .fifaWorldCup,                 header: "Goalscorers"),
        TopScorer(season: "1930",       competition: .fifaWorldCup,                 header: "Goalscorers"),
    ]
}
