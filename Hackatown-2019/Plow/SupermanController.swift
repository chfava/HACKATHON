//
//  ViewController.swift
//  Plow
//
//  Created by Charles-Olivier Presario on 2018-01-20.
//  Copyright © 2018 The keys is to make it. All rights reserved.
//

import UIKit
import GoogleMaps



class Superman: UIViewController {

    @IBOutlet weak var stuckButton: UIButton!

    @IBOutlet weak var supermanButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hideKeyboardWhenTappedAround() 
        stuckButton.layer.cornerRadius = 10
        //supermanButton.layer.cornerRadius = 10
    }

    /*override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 45.50884, longitude: -73.58781, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 45.50884, longitude: -73.58781)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }*/
    
    
    
    @IBAction func showMap(_ sender: Any) {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 45.50884, longitude: -73.58781, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 45.50884, longitude: -73.58781)
        marker.title = "Montreal"
        marker.snippet = "Canada"
        marker.map = mapView
    }
    @IBAction func showList(_ sender: Any) {
        
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

