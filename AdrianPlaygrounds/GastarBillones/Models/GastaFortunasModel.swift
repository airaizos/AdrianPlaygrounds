//
//  GastaFortunasModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 2/8/21.
//

import Foundation


class GastaFortunas: ObservableObject {
    let ricos:  [String:Int] = [
        "Jeff Bezos":116_200_000_000,
        "Amancio Ortega":76_600_000_000,
        "Carlos Slim":61_500_000_000,
        "Jack Ma":47_100_000_000,
        "Françoise Bettancourt":59_300_000_000]
    

    
    
    @Published var ricoElegido = "Jeff Bezos"
    @Published var fortunaElegida = 116_200_000_000
    @Published var gastado:Double = 0
    @Published var cantidad = 0
    @Published var items: [String] = []
    @Published var remanente = 0
    
    
    
        
        
        
        
    
    
    
}
    
    
 
    
    

