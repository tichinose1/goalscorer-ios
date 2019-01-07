//
//  MapsViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

class MapsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self

        let associations = LocalStorage<Association>()
            .findAll()
            .filter("competitions.@count > 0")
        let annotations = Array(associations).map(AssociationAnnotation.init)
        mapView.addAnnotations(annotations)
        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: 47.381389, longitude: 8.574444)
    }
}

extension MapsViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? AssociationAnnotation else { fatalError() }
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) else { fatalError() }

        annotationView.canShowCallout = true
        let image = annotation.association.image!
        annotationView.leftCalloutAccessoryView = UIImageView(image: image)
        let button = UIButton(type: .detailDisclosure)
        annotationView.rightCalloutAccessoryView = button
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? AssociationAnnotation else { fatalError() }

        let vc = AssociationTableViewController.instantiate()
        vc.association = annotation.association
        navigationController?.pushViewController(vc, animated: true)
    }
}
