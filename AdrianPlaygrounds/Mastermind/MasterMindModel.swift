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
    let tiposCanicas:[Character] = ["β€οΈ","ππ»ββοΈ","π","πΆ","π€"]
    var canicas:[Character] {
        
        switch tiposCanicas {
        case [Character("β€οΈ")]: return ["β€οΈ","π","π","π"]
        case [Character("ππ»ββοΈ")]: return ["ππ»ββοΈ","π€ΌββοΈ","π€Έπ»ββοΈ","βΉπ»ββοΈ"]
        case [Character("π")]: return ["β½οΈ","π","π","βΎοΈ"]
        case [Character("πΆ")]: return ["πΆ","π±","π­","π°"]
        case [Character("π€")]: return ["π","πΉ","π","π€"]
        default:                return ["β€οΈ","π","π","π"]
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
