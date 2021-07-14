//
//  BastaModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 14/7/21.
//

import Foundation



class JuegoBasta: ObservableObject {
    
   @Published var abcd = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","Y","Z"]
    
    @Published var palabrasEscritas = [String]()
    @Published var letra = ""
    @Published var puntos = 0
    @Published var palabra = ""
    @Published var palabraGuardada = ""
    
}
