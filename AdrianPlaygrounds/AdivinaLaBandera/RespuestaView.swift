//
//  RespuestaView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 27/9/21.
//

import SwiftUI



struct RespuestaView: View {
    
    @ObservedObject var bandera: Banderas
    
    var body: some View {
        VStack {
            Button(action: {
                bandera.preguntar()
            }) {
            
                Image(bandera.paises[bandera.respuestaCorrecta])
                    .renderingMode(.original)
                    .resizable()
                    .modifier(rectanguloBandera())
            }
            
            Section {
                Text(bandera.paises[bandera.respuestaCorrecta])
                    .foregroundColor(.secondary)
                    Text("Puntos \(bandera.puntuación)")
                        .foregroundColor(color1)
                    Text("Racha \(bandera.racha)")
                        .foregroundColor(color3)
            }
                .font(.largeTitle)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
}

struct RespuestaView_Previews: PreviewProvider {
    static var previews: some View {
        RespuestaView(bandera: Banderas())
    }
}
