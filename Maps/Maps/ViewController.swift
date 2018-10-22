//
//  ViewController.swift
//  Maps
//
//  Created by David E Bratton on 10/22/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let latitude: CLLocationDegrees = 42.201516
        let longitude: CLLocationDegrees = -88.395321
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "David's House"
        annotation.subtitle = "This is a great place to live"
        annotation.coordinate = location
        
        mapView.addAnnotation(annotation)
        
        // CALL FUNCTION longpress
        let longPressRecogizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecogmizer:)))
        longPressRecogizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(longPressRecogizer)
        
        
    }
    
    // THIS FUNCTION REQUIRES @objc
    @objc func longpress(gestureRecogmizer: UIGestureRecognizer) {
        let touchPoint = gestureRecogmizer.location(in: self.mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New Place"
        annotation.subtitle = "Maybe I will go here too..."
        mapView.addAnnotation(annotation)
        
    }


}

