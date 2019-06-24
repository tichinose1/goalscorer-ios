//
//  Repository.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/01/06.
//  Copyright © 2019 example.com. All rights reserved.
//

import Foundation
import RealmSwift
import Firebase

final class Repository {

    func initialize() {
        initRealm()

        migrateToFirestore()
    }
}

private extension Repository {

    func initRealm() {
        let storageURL = Realm.Configuration.defaultConfiguration.fileURL!
        let bundleURL = Bundle.main.url(forResource: "default", withExtension: "realm")!
        do {
            try FileManager.default.removeItem(at: storageURL)
            try FileManager.default.copyItem(at: bundleURL, to: storageURL)
        } catch {
            print(error.localizedDescription)
        }
    }

    func migrateToFirestore() {
        let db = Firestore.firestore()

        // Associations
        let associationsBatch = db.batch()
        RealmDAO<Association>().findAll().forEach { a in
            associationsBatch.setData(["region_code": a.regionCode,
                                       "name": a.name,
                                       "coordinate": GeoPoint(latitude: a.latitude, longitude: a.longitude)],
                                      forDocument: db.collection("associations").document())
        }
        associationsBatch.commit { err in
            if let err = err { fatalError(err.localizedDescription) }
            db.collection("associations").getDocuments { associationsQuerySnapshot, err in
                if let err = err { fatalError(err.localizedDescription) }
                guard let associationsQuerySnapshot = associationsQuerySnapshot else { fatalError("querySnapshot is nil") }
                // Competitions
                let competitionsBatch = db.batch()
                associationsQuerySnapshot.documents.forEach { a in
                    guard let associationName = a.data()["name"] as? String else { fatalError("name not found") }
                    RealmDAO<Competition>().findAll().filter { $0.association.name == associationName }.forEach { c in
                        competitionsBatch.setData(["name": c.name,
                                                   "associationRef": a.reference,
                                                   "kind": c.kind,
                                                   "order": c.order],
                                                  forDocument: db.collection("competitions").document())
                    }
                }
                competitionsBatch.commit { err in
                    if let err = err { fatalError(err.localizedDescription) }
                    // Players
                    let playersBatch = db.batch()
                    associationsQuerySnapshot.documents.forEach { a in
                        guard let associationName = a.data()["name"] as? String else { fatalError("name not found") }
                        RealmDAO<Player>().findAll().filter { $0.association.name == associationName }.forEach { p in
                            playersBatch.setData(["url": p.url,
                                                  "name": p.name,
                                                  "associationRef": a.reference,
                                                  "order": p.order],
                                                 forDocument: db.collection("players").document())
                        }
                    }
                    playersBatch.commit { err in
                        if let err = err { fatalError(err.localizedDescription) }
                        db.collection("competitions").getDocuments { competitionsQuerySnapshot, err in
                            if let err = err { fatalError(err.localizedDescription) }
                            guard let competitionsQuerySnapshot = competitionsQuerySnapshot else { fatalError("querySnapshot is nil") }
                            // Overall Scorers
                            let overallScorersBatch = db.batch()
                            competitionsQuerySnapshot.documents.forEach { c in
                                guard let competitionName = c.data()["name"] as? String else { fatalError("name not found") }
                                RealmDAO<OverallScorer>().findAll().filter { $0.competition.name == competitionName }.forEach { o in
                                    overallScorersBatch.setData(["url": o.url,
                                                                 "competitionRef": c.reference],
                                                                forDocument: db.collection("overall_scorers").document())
                                }
                            }
                            overallScorersBatch.commit { err in
                                if let err = err { fatalError(err.localizedDescription) }
                                // Scorers
                                let scorersBatch = db.batch()
                                competitionsQuerySnapshot.documents.forEach { c in
                                    guard let competitionName = c.data()["name"] as? String else { fatalError("name not found") }
                                    RealmDAO<Scorer>().findAll().filter { $0.competition.name == competitionName }.forEach { s in
                                        scorersBatch.setData(["url": s.url,
                                                              "title": s.title,
                                                              "competitionRef": c.reference,
                                                              "season": s.season],
                                                             forDocument: db.collection("scorers").document())
                                    }
                                }
                                scorersBatch.commit { err in
                                    if let err = err { fatalError(err.localizedDescription) }

                                    print("success.")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
