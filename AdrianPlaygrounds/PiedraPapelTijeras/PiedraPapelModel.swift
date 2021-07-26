//
//  PiedraPapelModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 25/7/21.
//

import Foundation


struct PiedraPapel {
    
    let cartas:[Character] = ["✊🏼","✋🏼","✌🏼","🦎","🖖🏽"]
    
    var puntosPhone = 0
    var puntosHumano = 0

    var punto = ["",""]
    
    
    mutating func puntoJugado(humano: Character) {
        let phone:Character = cartas[Int.random(in: 0..<cartas.count)]
        
        var punto:[Character] = []
        punto.append(phone)
        punto.append(humano)
        
        switch punto {
        //phone GANA
        
        case ["✊🏼","✌🏼"] : puntosPhone += 1
        case ["✊🏼","🦎"] : puntosPhone += 1
        case ["✋🏼","🖖🏽"] : puntosPhone += 1
        case ["✋🏼","✊🏼"] : puntosPhone += 1
        case ["✌🏼","✋🏼"] : puntosPhone += 1
        case ["✌🏼","🦎"] : puntosPhone += 1
        case ["🦎","🖖🏽"] : puntosPhone += 1
        case ["🦎","✋🏼"] : puntosPhone += 1
        case ["🖖🏽","✌🏼"] : puntosPhone += 1
        case ["🖖🏽","✊🏼"] : puntosPhone += 1
            
        //human GANA
            
        case ["✊🏼","✌🏼"] : puntosPhone += 1
        case ["✊🏼","🦎"] : puntosPhone += 1
        case ["✋🏼","🖖🏽"] : puntosPhone += 1
        case ["✋🏼","✊🏼"] : puntosPhone += 1
        case ["✌🏼","✋🏼"] : puntosPhone += 1
        case ["✌🏼","🦎"] : puntosPhone += 1
        case ["🦎","🖖🏽"] : puntosPhone += 1
        case ["🦎","✋🏼"] : puntosPhone += 1
        case ["🖖🏽","✌🏼"] : puntosPhone += 1
        case ["🖖🏽","✊🏼"] : puntosPhone += 1
            
            
    //push
            
        default: break
        
        
        }
        
        
        
        
    }
    
    
}
