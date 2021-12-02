//
//  BlackJackModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 23/11/21.
//

import Foundation
import SwiftUI


let cards = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
let suit = ["♠️","♦️","♣️","♥️"]

func createDeckCars(cards: [String], suit: [String]) -> [String] {
    var deckCards: [String] = []
    
    for s in suit {
        for card in cards {
            deckCards.append("\(card)\(s)")
        }
    }
    return deckCards.shuffled()
}

var playerCards: [String] = []
var croupierCards: [String] = []

var totalPlayer: Int = 0
var totalCroupier: Int = 0


//MARK: Cuenta 1 string
func convierteAInt(carta: String) -> Int {
    let numero = carta.dropLast()
    
    let num = Int(numero) != nil ? Int(numero)! : 0
    
    return num
}

func puntos(carta: String) -> Int {
    var total = 0
    //quito la suite de la carta
    let numero = carta.dropLast()
    
    // si es entre 2 y 9
    let num = Int(numero) != nil ? Int(numero)! : 0
    total += num
    
    if numero == "J" || numero == "Q" || numero == "K" {
        total += 10
    }
    
    return total
    
}

//MARK: Cuenta crupier
func laCuenta(cartas: [String]) -> Int {
    // hacer dos sumas y devolver la mayor y menor de 21
    
    var total = 0
    
//    print("inicio \(total)")
    for i in cartas {
        let numero = i.dropLast()
        
        let num = Int(numero) != nil ? Int(numero)! : 0
        total += num
        
  //      print("num \(total)")
        
        if numero == "J" || numero == "Q" || numero == "K" {
            total += 10
           
    //        print("J \(total)")
            
            //BlackJack
        } else if numero == "A" && total < 22 {
               total += 11
    //        print("As1\(total)")
        } else if numero == "A" && total > 21 {
            total += 1
      //      print("as10\(total)")
        }
    
    }
    print(total)
    return total
}

func laCuentaJugador(cartas:[String]) -> Int {
    var total = 0
    
    //    print("inicio \(total)")
        for i in cartas {
            let numero = i.dropLast()
            
            let num = Int(numero) != nil ? Int(numero)! : 0
            total += num
            
      //      print("num \(total)")
            
            if numero == "J" || numero == "Q" || numero == "K" {
                total += 10
            }
        //        print("J \(total)")
            
            if numero == "A" {
                if total < 11 {
                    total += 11
                } else {
                    total += 1
                }
            }
        }
    return total
}


struct MensajePartida {
    let title = ""
    let puntosCrupier = ""
    let puntosJugador = ""
    let ganador = ""

}
