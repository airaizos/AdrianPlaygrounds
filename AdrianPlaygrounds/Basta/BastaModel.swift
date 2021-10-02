//
//  BastaModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 14/7/21.
//

import Foundation
import SwiftUI


class JuegoBasta: ObservableObject {
    
   @Published var abcd = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","Y","Z"]
    
    @Published var palabrasEscritas = [String]()
    @Published var letra = ""
    @Published var puntos = 0
    @Published var palabra = ""
    @Published var palabraGuardada = ""
    @Published var errorTitulo = ""
    @Published var errorMensaje = ""
    @Published var mostrarError = false
    @Published var racha = 0
    
    
    //MARK: Validación Funciones
    func valida(palabra: String) -> Bool {
        let verificador = UITextChecker()
        let rango = NSRange(location: 0, length: palabra.utf16.count)
        let rangoMalEscrito = verificador.rangeOfMisspelledWord(in: palabra, range: rango, startingAt: 0, wrap: false, language: "es")
       
        return rangoMalEscrito.location == NSNotFound
    }

    func esMenorDeTresLetras(palabra: String) -> Bool {
        if palabra.count < 3 {
            return false
        }
        return true
    }

    func errorPalabra(titulo: String, mensaje: String) {
        errorTitulo = titulo
        errorMensaje = mensaje
        mostrarError = true
    }
    
    func esPosible(palabra: String, letra: String) -> Bool {
        if palabra.hasPrefix(letra) {
            return true
        }
        return false
    }
    
    func yaUsada(palabra: String) -> Bool {
        !palabrasEscritas.contains(palabra)
    }
    
    func añadePalabra() {
        
        let respuesta = palabra.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard respuesta.count > 0 else {
            return
        }
        
        print(respuesta)
        //Validaciones
        
        guard yaUsada(palabra: respuesta) else {
            errorPalabra(titulo: "Palabra ya usada", mensaje: "Piensa un poco más")
            racha = 0
            puntos -= 1
            return
        }
        
        guard esPosible(palabra: respuesta, letra: letra) else {
            errorPalabra(titulo: "No comienza por \(letra.uppercased())", mensaje: "Prueba otra vez")
            racha = 0
            puntos -= 1
            return
        }
        
        guard valida(palabra: respuesta) else {
            errorPalabra(titulo: "Esa palabra no existe", mensaje: "No inventes")
            racha = 0
            puntos -= 1
            return
        }
        
        guard esMenorDeTresLetras(palabra: respuesta) else {
            errorPalabra(titulo: "¿Menos de 3 letras? ¿¿En serio??", mensaje: "Puedes hacerlo mejor")
            racha = 0
            puntos -= 1
            return
        }
        puntos += 1
        racha += 1
        palabrasEscritas.insert(respuesta, at: 0)
        palabra = ""
        
    }
    
}



