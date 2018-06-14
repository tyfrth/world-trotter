//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Tyler Frith on 1/11/18.
//  Copyright © 2018 tfrth. All rights reserved.
//

//import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController {
    //initialize map view programmatically
    var mapView: MKMapView!
    
    //need to overrride loadview in order to create view programmatically
    override func loadView() {
        //create a map view
        mapView = MKMapView()
        
        //set it as *th* view of this view controller
        view = mapView
        
        //create our segmented control
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(segControl:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //adding constraints programmatically
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        //activate constraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
    }
    
    override func viewDidLoad() {
        //again, always need to call super implementation of viewDidLoad
        super.viewDidLoad()
        
        print("MapViewController has loaded it's view :)")
    }
    
    @objc func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
}

