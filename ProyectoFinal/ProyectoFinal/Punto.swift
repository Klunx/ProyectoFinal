//
//  Punto.swift
//  ProyectoFinal
//
//  Created by Fernando Renteria Correa on 15/07/2016.
//  Copyright © 2016 Fernando Renteria Correa. All rights reserved.
//

import Foundation
import MapKit
class Punto {
    
    var newAnotation = MKPointAnnotation()
    var imagePath : String = ""
    
    init () {}
    
    init (newAnotation : MKPointAnnotation) {
        self.newAnotation = newAnotation
    }
        
}