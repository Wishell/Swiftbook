//  
//  MapView.swift
//  Eaters
//
//  Created by Wishell on 04.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewInput: class {
    var mapView: MKMapView? {get}
}

final class MapView: UIView {
    
    @IBOutlet weak var map: MKMapView!
    var mapView: MKMapView? { return map }
}

// MARK: - MapViewInput
extension MapView: MapViewInput {}
