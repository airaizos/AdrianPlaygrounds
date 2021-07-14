//
//  BastaView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 13/7/21.
//

import SwiftUI

struct BastaView: View {

    @ObservedObject var modelo = JuegoBasta()
    let gridItem = [GridItem(.adaptive(minimum: 50))]
    
   @State private var iniciado = false
    
    var body: some View {
      
        VStack{
            Button(action: {
                modelo.letra = modelo.abcd[Int.random(in: 0..<modelo.abcd.count)]
                modelo.palabrasEscritas = []
                modelo.puntos = 0
                iniciado.toggle()
                
            }
                   , label: {
                Text("Empezar")
            })
            ZStack {
                Circle()
                    .foregroundColor(Color(red: 0.66, green: 0.33, blue: 77, opacity: 0.4))
                    .frame(width: 100, height: 100, alignment: .bottom)
                Text("\(modelo.letra)")
            .font(.system(size: 70))
                    .foregroundColor(.white)
            .bold()
            } .padding()
            
            VStack {
            Text("Puntos: \(modelo.puntos)")
            
            TextField("Palabra", text: $modelo.palabra)
               
          
            Button(action: {
                modelo.palabraGuardada = modelo.palabra
             
                if modelo.palabrasEscritas.firstIndex(of: "\(modelo.palabraGuardada)") != nil {
                    modelo.puntos += 0
                    modelo.palabra = ""
                    
                    
            } else if modelo.palabraGuardada.hasPrefix("\(modelo.letra)") {
                    modelo.puntos += 3
                    modelo.palabra = ""
                    modelo.palabrasEscritas.append(modelo.palabraGuardada)
                    
                } else {
                    modelo.puntos -= 1
                    modelo.palabra = ""
                }
            }
                   , label: {
                Text("Siguiente")
                   })
            
            
            Spacer()
            LazyVGrid(columns: gridItem, alignment: .leading, spacing: 10) {
            ForEach(modelo.palabrasEscritas, id:\.self) { palabra in
                Text("\(palabra)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                }
            }
            }.disabled(iniciado ? false : true)
            Spacer()
            Text("Instrucciones: Escribe una palabra que inicie con la letra que aparece y gana 3 puntos, sino pierdes 1").multilineTextAlignment(.center)
        } .padding()
    }
}

struct BastaView_Previews: PreviewProvider {
    static var previews: some View {
        BastaView(modelo: JuegoBasta())
    }
}
