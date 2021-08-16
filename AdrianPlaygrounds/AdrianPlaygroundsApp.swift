//
//  AdrianPlaygroundsApp.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 13/7/21.
//

import SwiftUI

@main
struct AdrianPlaygroundsApp: App {
   
    
   @StateObject private var catalogo = Catalogo()
 var fortuna = GastaFortunas()
    var body: some Scene {
        
        WindowGroup {
            NavigationView{
            MasterMindView()
                
                
                
//                GastaFortunasView(filtro: .Arte)
//            .environmentObject(catalogo)
//                    .environmentObject(fortuna)
                
            }
        }
    }
}
