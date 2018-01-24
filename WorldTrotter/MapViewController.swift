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
    }
    
    override func viewDidLoad() {
        //again, always need to call super implementation of viewDidLoad
        super.viewDidLoad()
        
        print("MapViewController has loaded it's view :)")
    }
    
}

