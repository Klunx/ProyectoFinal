//
//  Ruta.swift
//  ProyectoFinal
//
//  Created by Fernando Renteria Correa on 11/07/2016.
//  Copyright © 2016 Fernando Renteria Correa. All rights reserved.
//

import Foundation

class Ruta {
    
    var titulo : String = ""
    var descripcion : String = ""
    var puntosEnLaRuta = [Punto]()
    
    init () {}
    
    init (titulo : String, descripcion : String) {
        self.titulo = titulo
        self.descripcion = descripcion
    }
    
}