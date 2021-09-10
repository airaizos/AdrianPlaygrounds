//  MasterMindModel.swift
//  AdrianPlaygrounds
//  Created by Adrian Iraizos Mendoza on 9/8/21.
/*
 
 ------>    MODEL  <---------
 
 */
import Foundation


struct Canica: Identifiable {
    var id: Int
    var canica: Character
    var tipo: Tipo
    
    
}

struct JuegoCanicas {
    let tiposCanicas:[Character] = ["❤️","🏋🏻‍♀️","🏈","🐶","🤖"]
    var canicas:[Character] {
        
        switch tiposCanicas {
        case [Character("❤️")]: return ["❤️","💛","💚","💜"]
        case [Character("🏋🏻‍♀️")]: return ["🏋🏻‍♀️","🤼‍♀️","🤸🏻‍♀️","⛹🏻‍♀️"]
        case [Character("🏈")]: return ["⚽️","🏀","🏈","⚾️"]
        case [Character("🐶")]: return ["🐶","🐱","🐭","🐰"]
        case [Character("🤖")]: return ["😈","👹","💀","🤖"]
        default:                return ["❤️","💛","💚","💜"]
        }
    }
}

enum Tipo {
    case corazones, deportes, balones, mamiferos,personajes
}

struct Intento: Identifiable {
    var id: Int
    var aciertos: [Character]
    var canicas: [Character]
    
}
