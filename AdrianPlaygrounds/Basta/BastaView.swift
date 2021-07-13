//
//  BastaView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 13/7/21.
//

import SwiftUI

struct BastaView: View {
    let abcd = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","Y","Z"]
    
    @State private var letra = ""
    
    @State private var puntos = 0
    @State private var palabra = ""
    
    var body: some View {
      
        VStack{
            Button(action: {
                letra = abcd[Int.random(in: 0..<abcd.count)]
            }
                   , label: {
                Text("Empezar")
            })
            ZStack {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        Text("\(letra)")
            .font(.largeTitle)
            .bold()
            } .padding()
            
            Text("Puntos: \(puntos)")
            
            TextField("Palabra", text: $palabra)
               
          
            Button(action: {
                let palabraGuardada = palabra
                
                if palabraGuardada.hasPrefix("\(letra)") {
                    puntos += 3
                    palabra = ""
                    
                } else {
                    puntos -= 1
                    palabra = ""
                }
            }
                   , label: {
                Text("Siguiente")
            })
            Spacer()
            
            Text("Instrucciones: Escribe una palabra que inicie con la letra que aparece y gana 3 puntos, sino pierdes 1").multilineTextAlignment(.center)
        } .padding()
    }
}

struct BastaView_Previews: PreviewProvider {
    static var previews: some View {
        BastaView()
    }
}
