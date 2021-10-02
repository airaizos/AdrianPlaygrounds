//
//  Generales.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 30/9/21.
//

import SwiftUI

class Marcador: ObservableObject {
    @Published var puntos = 0 {
        didSet {
            UserDefaults.standard.integer( forKey: "Puntos")
        }
    }
    @Published var racha = 0 {
        didSet {
            UserDefaults.standard.integer(forKey: "Racha")
        }
    }
    init() {
        puntos =  UserDefaults.standard.integer(forKey: "Puntos")
        
        racha = UserDefaults.standard.integer(forKey: "Racha")
    }
}


//struct botonPaginaPrincipal: ViewModifier {
//
//    func body(contenido: Content, nombre: String, color: Color) -> some View {
//        contenido
//            .font(.system(size: nombre.count == 1 ? 50 : 29))
//            .font(.title2)
//            .padding(5)
//            .shadow(radius: 10)
//            .frame(width: 100, height: 100)
//            .overlay(Circle()
//                .stroke(lineWidth: 10))
//                .shadow(radius: 90)
//                .foregroundColor(color)
//    }
//}
//, nombre: String, color: Color

struct botonPaginaPrincipal: ViewModifier {
    func body(content: Content) -> some View {
        content
        //            .font(.system(size: nombre.count == 1 ? 50 : 29))
            .font(.title2)
            .padding(5)
            .shadow(radius: 10)
            .frame(width: 100, height: 100)
            .overlay(Circle()
                .stroke(lineWidth: 10))
                .shadow(radius: 90)
        //                .foregroundColor(color)
    }
}
