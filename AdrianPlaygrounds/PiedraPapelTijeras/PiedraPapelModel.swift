//
//  PiedraPapelModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 25/7/21.
//

import Foundation
import AVFoundation

class PiedraPapel: ObservableObject {
    
    let cartas:[String] = ["✊🏼","✋🏼","✌🏼","🦎","🖖🏽"]
    var idCarta = 0
    let puntos = [0,15,30,40]
    
    @Published  var punto = ["",""]
    @Published  var phone = "❓"
    @Published  var humano = "❓"
    
    //MARK: Puntuacion
    @Published var ganador = ""
    
    
    //Phone
    @Published var puntosPhone = 0
    @Published var scorePuntosPhone = 0
    @Published var puntoPhone = 0
    @Published var juegoPhone = 0
    @Published var setPhone = 0
    
    //Humano
    @Published var puntosHumano = 0
    @Published var scorePuntosHuman = 0
    @Published var puntoHumano = 0
    @Published var juegoHumano = 0
    @Published var setHumano = 0
    
    
    
    func start() {
        
        scorePuntosPhone = 0
        puntosPhone = 0
        juegoPhone = 0
        setPhone = 0
        
        
        scorePuntosHuman = 0
        puntosHumano = 0
        puntosHumano = 0
        juegoHumano = 0
        setHumano = 0
        ganador = "¡¡Empezar!!"
        
    }
    
    //juego, set, partido
    
    func restartPuntos(){
        scorePuntosPhone = 0
        scorePuntosHuman = 0
        puntosPhone = 0
        puntosHumano = 0
        ganador = ""
    }
    func calculoScore() {
        
        scorePuntosPhone = puntos[puntosPhone]
        scorePuntosHuman = puntos[puntosHumano]
        
        // juego
        
        if scorePuntosPhone == 40 {
            
            juegoPhone += 1
            
            restartPuntos()
            ganador = "Gana juego Phone"
        } else if scorePuntosHuman == 40 {
            
            juegoHumano += 1
            
            restartPuntos()
            ganador = "Gana juego Humano"
        }
        
        // set
        
        if juegoPhone == 3 {
            
            setPhone += 1
            juegoPhone = 0
            juegoHumano = 0
            restartPuntos()
            ganador = "Gana Set Phone"
            
        } else if juegoHumano == 3 {
           
            setHumano += 1
            juegoPhone = 0
            juegoHumano = 0
            restartPuntos()
            ganador = "Gana Set Humano"
        }
        
        if setPhone == 3 {
            ganador = "Gana Phone"
        } else if setHumano == 3 {
            ganador = "Gana Humano"
        }
        
        
    }
    
    //MARK: TODO: Con sonidos??
    func puntoJugado(humanoB: String) {
        AudioServicesPlaySystemSound(1003)
        funcIdCarta(humanoB: humanoB)
        phone = cartas[Int.random(in: 0..<cartas.count)]
        humano = humanoB
        var punto:[String] = []
        
        punto.append(phone)
        punto.append(humano)
        
        switch punto {
        //phone GANA
        
        case ["✊🏼","✌🏼"], ["✊🏼","🦎"], ["✊🏼","🦎"], ["✊🏼","🦎"],["✋🏼","🖖🏽"],["✋🏼","✊🏼"],["✌🏼","✋🏼"],["✌🏼","🦎"],["🦎","🖖🏽"],["🦎","✋🏼"],["🖖🏽","✌🏼"], ["🖖🏽","✊🏼"] : puntosPhone += 1; ganador = "Gana Phone"
            
        //human GANA
            
        case ["✌🏼","✊🏼"],["🦎","✊🏼"],["🖖🏽","✋🏼"], ["✊🏼","✋🏼"],["✋🏼","✌🏼"],["🦎","✌🏼"], ["🖖🏽","🦎"],["✋🏼","🦎"],["✌🏼","🖖🏽"],["✊🏼","🖖🏽"] : puntosHumano += 1; ganador = "Gana Human"
            
        default: ganador = "Empate"; break
        
        }
        calculoScore()
        
        print("\(punto) : \(puntosPhone) - \(puntosHumano) : \(ganador)")
    
    }
    
    func funcIdCarta(humanoB: String) {
            switch humanoB {
            case "✊🏼": idCarta = 0
            case "✋🏼": idCarta = 1
            case "✌🏼": idCarta = 2
            case "🦎": idCarta = 3
            case "🖖🏽": idCarta = 4
            default:     idCarta = 0
            }
    }
}
