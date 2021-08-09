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
    enum categoria {
        case Inmuebles, Personal, Tecnología, Equipos, Transporte, Arte
    }
}

struct Diseño {
    var cNombre: Color
    var cPrecio: Color
    var cBackground: Color
    var cStroke: Color
}
