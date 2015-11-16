//
//  CurrentLocationViewController.swift
//  test
//
//  Created by Nicholas Miller on 11/14/15.
//  Copyright © 2015 BirdWIng. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    
    // necessary to center our MapView
    let regionRadius: CLLocationDistance = 50
    let geocoder = CLGeocoder()
    
//    Need this as a property for our class because the coreLocation delegate
    let locationManager = CLLocationManager()
    var location: CLLocation?
    
    var updatingLocation = false
    var lastLocationError: NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // method to center mapview on a given location
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.showsUserLocation = true
    }
    
    /*
    In order for us to see our location we have to allow the code to get it.
    We go to info.plist
    Add row
    the key is NSLocationWhenInUseUsageDescription
    give a description
    */
    
    @IBAction func getLocation() {
//        Need authorization status
        let authStatus: CLAuthorizationStatus =
        CLLocationManager.authorizationStatus()
        if authStatus == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
//        Gets the current location
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        locationManager.startUpdatingLocation()
        startLocationManager()
    }
    
    @IBAction func stopGathering() {
        stopLocationManager()
    }
    
//    Whenever we fail to get the location
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError \(error)")
        
        if (error.code == CLError.LocationUnknown.rawValue) {
            return
        }
//        We keep the last error we encountered
        lastLocationError = error
        stopLocationManager()
        updateLabels()
    }
    
//    If the location was updated
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last! as CLLocation
        print("didUpdateLocations \(newLocation)")
        
        lastLocationError = nil
        location = newLocation
        updateLabels()
        centerMapOnLocation(location!)
        placeNameFromLatLong()
    }
    
//    This will start the location gathering
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
        }
    }
    
//    This will stop the location gathering
    func stopLocationManager() {
        if (updatingLocation) {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
        }
    }
    
//    Our universal method to update labels
    func updateLabels() {
        if let location = location {
//            This is just a way to format the string to be certain way
            latitudeLabel.text = String(format: "%.8f", location.coordinate.latitude)
            longitudeLabel.text = String(format: "%.8f", location.coordinate.longitude)
            messageLabel.text = "CoreLocation + MapKit is awesome!😁"
            messageLabel.sizeToFit()
        }
        else {
            latitudeLabel.text = ""
            longitudeLabel.text = ""
            addressLabel.text = ""
            messageLabel.text = "Tap 'Get My Location' to Start"
        }
    }
    
    // Function to get place name like "Union Square Park" or address from lat/long coordinates
    func placeNameFromLatLong() {
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("reverse geodcode fail: \(error!.localizedDescription)")
            } else {
                let placemark = placemarks! as [CLPlacemark]
                let locationName = placemark[0].name
                print("@@@@THE LOCATION ISSsSSSSSSS", locationName)
                self.addressLabel.text = locationName
                self.addressLabel.sizeToFit()
                
            }
            
        })
    }

    
}


