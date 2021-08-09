//
//  GastaFortunasModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 2/8/21.
//

import Foundation


class GastaFortunas: ObservableObject {

    var ricoElegido = "Jeff Bezos"
    var fortunaElegida = 116_200_000_000
    @Published var gastado:Double = 0
    @Published var cantidad = 0
    @Published var items: [String] = []
    
}
    
    
 
    
    

