//
//  MapsViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class MapsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self

        // TODO: マップの中心をどこにするかは議論の余地あり
        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: 47.381389, longitude: 8.574444)

        Firestore.firestore().collection("associations").getDocuments { snapshot, error in
            // TODO: エラー処理
            guard let documents = snapshot?.documents else { return }

            // TODO: competitionsが0のassociationもピンとして表示している
            let annotations = documents.map(AssociationAnnotation.init)
            self.mapView.addAnnotations(annotations)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setScreenName("Maps")
    }
}

extension MapsViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? AssociationAnnotation else { fatalError() }
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) else { fatalError() }

        annotationView.canShowCallout = true

        let regionCode = annotation.association["region_code"] as! String
        annotationView.leftCalloutAccessoryView = UIImageView(image: regionCode.image!)

        let button = UIButton(type: .detailDisclosure)
        annotationView.rightCalloutAccessoryView = button

        return annotationView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? AssociationAnnotation else { fatalError() }

        Firestore.firestore().collection("competitions").whereField("association_ref", isEqualTo: annotation.association.reference).getDocuments { snapshot, error in
            // TODO: エラー処理
            guard let documents = snapshot?.documents else { return }

            // TODO: MKAnnotationは更新されるが、MKAnnotationViewは更新されない？
            annotation.setCompetitions(snapshots: documents)
        }
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? AssociationAnnotation else { fatalError() }

        let vc = AssociationTableViewController.instantiate()
        navigationController?.pushViewController(vc, animated: true)
    }
}
