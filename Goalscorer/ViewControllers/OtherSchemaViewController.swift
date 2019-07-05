//
//  OtherSchemaViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2019/07/03.
//  Copyright © 2019 example.com. All rights reserved.
//

import UIKit
import Firebase

class OtherSchemaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Firestore.firestore().collection("associations").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }

            documents.forEach { association in
                print("association.data(): \(association.data())")

                let competitionRefs = association["competition_refs"] as! [DocumentReference]

                competitionRefs.forEach { competitionRef in
                    competitionRef.getDocument { snapshot, error in
                        guard let competition = snapshot else {
                            print("Error fetching documents: \(error!)")
                            return
                        }

                        print("competition.data(): \(competition.data())")

                        let scorerRefs = competition["scorer_refs"] as! [DocumentReference]

                        scorerRefs.forEach { scorerRef in
                            scorerRef.getDocument { snapshot, error in
                                guard let scorer = snapshot else {
                                    print("Error fetching documents: \(error!)")
                                    return
                                }

                                print("scorer.data(): \(scorer.data())")
                            }
                        }
                    }
                }
            }
        }
    }
}
