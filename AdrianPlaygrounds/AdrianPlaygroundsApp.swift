//
//  AdrianPlaygroundsApp.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 13/7/21.
//

import SwiftUI

@main
struct AdrianPlaygroundsApp: App {
   @StateObject private var modeloArticulos = ModeloArticulos()
    
    var body: some Scene {
        
        WindowGroup {
           
            PaginaPrincipal()
                   
                
        }
    }
}
