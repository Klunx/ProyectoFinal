//
//  MapLocatorVC.swift
//  ProyectoFinal
//
//  Created by Fernando Renteria Correa on 20/06/2016.
//  Copyright © 2016 Fernando Renteria Correa. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapLocatorVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    
    private let manejador = CLLocationManager()
    
    var startLocation: CLLocation!
    var lastLocation: CLLocation!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Inicializar mapa.
        manejador.delegate = self
        manejador.desiredAccuracy = kCLLocationAccuracyBest
        manejador.requestWhenInUseAuthorization()
        manejador.distanceFilter = 50
        
        longPressGesture()
        
    }
    
    func longPressGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction))
        longPress.minimumPressDuration = 2
        mapa.addGestureRecognizer(longPress)
    }

    func longPressAction(gestureRecognizer:UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.locationInView(self.mapa)
        let newCoord:CLLocationCoordinate2D = mapa.convertPoint(touchPoint, toCoordinateFromView: self.mapa)
        
        let newAnotation = MKPointAnnotation()
        newAnotation.coordinate = newCoord
        newAnotation.title = "New Location"
        newAnotation.subtitle = "New Subtitle"
        mapa.addAnnotation(newAnotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            manejador.startUpdatingLocation()
            mapa.showsUserLocation = true
        } else {
            manejador.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
       
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //var traveledDistance: CLLocationDistance = 0
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004))
        self.mapa.setRegion(region, animated: true)
        self.manejador.stopUpdatingLocation()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
