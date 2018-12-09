//  
//  MapViewController.swift
//  Eaters
//
//  Created by Wishell on 04.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    var model: MapModelInput!
    lazy var contentView: MapViewInput = { return view as! MapViewInput }()
    var restaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()
        let geocoder = CLGeocoder()
        
        contentView.mapView?.delegate = self
        geocoder.geocodeAddressString(restaurant.location!) { (placemarks, error) in
            
            guard `error` == nil else { return }
            guard let `placemarks` = placemarks else { return }
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = self.restaurant.name
            annotation.subtitle = self.restaurant.type
            
            guard let location = placemark?.location else { return }
            annotation.coordinate = location.coordinate
            
            self.contentView.mapView?.showAnnotations([annotation], animated: true)
            self.contentView.mapView?.selectAnnotation(annotation, animated: true)
        }
    }
    
    
}

// MARK: - MapModelOutput
extension MapViewController: MapModelOutput {}

// MARK: - MapViewControllerInput
extension MapViewController: MapViewControllerInput {}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }
        
        let annotationIdentifier = "restAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
        }
        
        let rightImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rightImage.image = UIImage(data: restaurant.image! as Data)
        annotationView?.rightCalloutAccessoryView = rightImage
        
        annotationView?.pinTintColor = #colorLiteral(red: 0, green: 0.9109624028, blue: 0.4841304421, alpha: 1)
        return annotationView
    }
    
}
