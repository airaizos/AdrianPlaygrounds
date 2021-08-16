//  MasterMindViewModel.swift
//  AdrianPlaygrounds
//  Created by Adrian Iraizos Mendoza on 9/8/21.
/*
 
 ------>    VIEWMODEL  <---------
 
 */
import Foundation
import SwiftUI

class MasterMindViewModel: ObservableObject {
    
    //MARK: @
    @Published var codigoSecreto:[Character] = []
    @Published var intentoIndice0 = 0
    @Published var intentoIndice1 = 0
    @Published var intentoIndice2 = 0
    @Published var intentoIndice3 = 0
    @Published var intentos: [Intento] = []
    @Published var gameOver  = true
    @Published var youWin = false
    //MARK: var y lets
/*  canica correcta Color y Posicion = 🟢
    canica correcta solo en Color = 🟠
    canica incorrecta = 🔴
 */
    var intentoArray: [Character] = []
    var intentoCuenta: Int = 0
    var cuentaIntentos = 0
    
    //MARK: Tipos de Canicas
    @Published var canicas: Character = "🏋🏻‍♀️"

    let tiposCanicas = ["❤️","🏋🏻‍♀️","🏈","🐶","🤖"]
    var corazones:[Character] = ["❤️","💛","💚","💜"]
    var intentoIndice = 0
    
    //MARK: Struct
    
    // MARK: Funciones
    //MARK: Funcion empezar
    func crearJuego() -> Array<Character> {
        var juegoCanica: [Character] {
                switch canicas {
                case "❤️" : return ["❤️","💛","💚","💜"]
                case "🏋🏻‍♀️" : return ["🏋🏻‍♀️","🤼‍♀️","🤸🏻‍♀️","⛹🏻‍♀️"]
                case "🏈" : return ["⚽️","🏀","🏈","⚾️"]
                case "🐶" : return ["🐶","🐱","🐭","🐰"]
                case "🤖" : return ["😈","👹","💀","🤖"]
                default   : return ["❤️","💛","💚","💜"]
                }
            
        }
        youWin = false
        gameOver = false
        intentos = []
        intentoIndice0 = 0
        intentoIndice1 = 0
        intentoIndice2 = 0
        intentoIndice3 = 0
        
        var codigo:[Character] = []
      
        for _ in 0..<4 {
           
            codigo.append(juegoCanica [Int.random(in: 0..<4)])
        }
        return codigo
    }
    //MARK: func intento
   
    func intento() {
        var juegoCanica: [Character] {
            switch canicas {
            case "❤️" : return ["❤️","💛","💚","💜"]
            case "🏋🏻‍♀️" : return ["🏋🏻‍♀️","🤼‍♀️","🤸🏻‍♀️","⛹🏻‍♀️"]
            case "🏈" : return ["⚽️","🏀","🏈","⚾️"]
            case "🐶" : return ["🐶","🐱","🐭","🐰"]
            case "🤖" : return ["😈","👹","💀","🤖"]
            default   : return ["❤️","💛","💚","💜"]
            }
            
        }
        var intentoActual: Intento = .init(id: cuentaIntentos, aciertos: [], canicas: [])
        var codigo = codigoSecreto
        print(codigo)
        cuentaIntentos += 1
        intentoArray.removeAll()
        
        /* 1: Añade las canicas elegidas al intentoActual y el intentoArray
        */
        intentoActual.canicas.append(juegoCanica[self.intentoIndice0])
        intentoActual.canicas.append(juegoCanica[self.intentoIndice1])
        intentoActual.canicas.append(juegoCanica[self.intentoIndice2])
        intentoActual.canicas.append(juegoCanica[self.intentoIndice3])
        
        intentoArray = intentoActual.canicas
    
        /*
        2:  Contar Aciertos en Color y Posición
        
        For: si el intento y el codigo coinciden en posicion y color: Añade 1 a aciertos y quita del intentoActual y del código esa canica.
        */
        
        var cuentaForI = 3
        for _ in 0...codigoSecreto.count-1 {
            
            if intentoActual.canicas[cuentaForI] == codigoSecreto[cuentaForI] {
                intentoActual.aciertos.append("🟢")
                intentoArray.remove(at: cuentaForI)
                codigo.remove(at: cuentaForI)
            }
            cuentaForI -= 1
        }
 
        /*
         3. Contar aciertos en Color
            For: por cada canica en intento, si está en código: Añade 🟠 a aciertos y quita del código esa canica.
            Sino está en código, añade 🔴.
         */
        for j in intentoArray {
                if codigo.contains(j) {
                    intentoActual.aciertos.append("🟠")
                    codigo.remove(at: codigo.firstIndex(of: j)!)
                    intentoArray.remove(at:  intentoArray.firstIndex(of: j)!)
                } else {
                    intentoActual.aciertos.append("🔴")
                }
            }
   
        print("intentoActual.Canicas\(intentoActual.canicas)")
        intentos.insert(intentoActual, at: 0)
        
        if intentoActual.aciertos == ["🟢","🟢","🟢","🟢"] {
            youWin = true
            gameOver = true
        }
    }

    //final de la clase
}

