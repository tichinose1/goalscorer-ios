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

    private let zurich = CLLocationCoordinate2D(latitude: 47.376886, longitude: 8.5416940)

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.centerCoordinate = zurich

        let competitions: [Competition] = [.fifaWorldCup]
        let annotations: [MKPointAnnotation] = competitions.map { c in
            let a = MKPointAnnotation.init()
            a.title = c.name
            a.coordinate = zurich
            return a
        }

        mapView.addAnnotations(annotations)
    }
}

extension MapsViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) else { fatalError() }

        annotationView.canShowCallout = true
        annotationView.leftCalloutAccessoryView = UIImageView(image: UIImage(named: "fifa")!)
        let button = UIButton(type: .detailDisclosure)
        button.addTarget(self, action: #selector(didTapRightCalloutAccessoryView), for: .touchUpInside)
        annotationView.rightCalloutAccessoryView = button
        return annotationView
    }
}

private extension MapsViewController {

    @objc func didTapRightCalloutAccessoryView() {
        presentSafariViewController(url: TopScorer.all.first!.url)
    }
}
