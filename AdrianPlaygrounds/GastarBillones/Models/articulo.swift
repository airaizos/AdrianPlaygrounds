//
//  articulo.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 2/8/21.
//

import Foundation

import SwiftUI

struct Articulo: Hashable, Codable, Identifiable {

    var id: Int
    var nombre: String
    var precio: Double
    var foto: String
    var categoria: String  
}



struct Fortuna: Hashable, Codable, Identifiable {
    var id: Int
    var nombre: String
    var fortuna: Int
    
    private var nombreImagen: String
        var imagen: Image {
            Image(nombreImagen)
        }
}


struct Gasta {
    var rico: String
    var fortuna: Int
    var gastado: Int
    var cantidad: Int
    var items: [String]
    
}


struct Categoria {
    var categoria: String
   
    enum categoria {
        case Inmuebles, Personal, Tecnología, Equipos, Transporte, Arte
    }
}
