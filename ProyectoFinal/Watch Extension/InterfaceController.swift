//
//  InterfaceController.swift
//  Watch Extension
//
//  Created by Fernando Renteria Correa on 17/07/2016.
//  Copyright © 2016 Fernando Renteria Correa. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var mapa: WKInterfaceMap!
    
    @IBAction func hacerZoom(value: Float) {
        let grados: CLLocationDegrees = CLLocationDegrees(value) / 10
        let ventana = MKCoordinateSpanMake(grados, grados)
        let startLocation = CLLocationCoordinate2D(latitude: 19.283996, longitude: -99.136006)
        let region = MKCoordinateRegionMake(startLocation, ventana)
        self.mapa.setRegion(region)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let startLocation = CLLocationCoordinate2D(latitude: 19.283996, longitude: -99.136006)
        let region = MKCoordinateRegion(center: startLocation, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapa.setRegion(region)
        self.mapa.addAnnotation(startLocation, withPinColor: .Purple)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
