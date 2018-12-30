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

        mapView.centerCoordinate = zurich
    }
}
