//
//  MapsViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/12/30.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.centerCoordinate = Association.fifa.coordinate

        let annotations = Association.all.filter { !$0.competitions.isEmpty }.map(AssociationAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}

extension MapsViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? AssociationAnnotation else { fatalError() }
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) else { fatalError() }

        annotationView.canShowCallout = true
        let regionCode = annotation.association.regionCode
        let image = createImage(code: regionCode)!
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
