//
//  AdivinaLaBanderaView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 27/9/21.
//

import SwiftUI

struct AdivinaLaBanderaView: View {
    
    @StateObject var bandera: Banderas
    @State private var incorrecta = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [colorBandera4,colorBandera5,colorBandera6]), startPoint: .bottomTrailing, endPoint: .topLeading)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 70) {
                if bandera.enJuego {
                    VStack {
                        Section {
                            Text("Pulsa la bandera de...")
                            Text(bandera.paises[bandera.respuestaCorrecta])
                        }
                        .foregroundColor(color1)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        ForEach( 0 ..< 4) { numero in
                            
                            withAnimation {
                                Button(action: {
                                    bandera.pulsada(numero)
                                }) {
                                    Image(bandera.paises[numero])
                                        .renderingMode(.original)
                                        .resizable()
                                        .modifier(rectanguloBandera())
                                       
                                }
                                .padding()
                            }
                        }
                    }
                    Spacer()
                } else {
                   
                    RespuestaView(bandera: bandera)
                    
                    
                }
            }
        }
    }
}

struct AdivinaLaBanderaView_Previews: PreviewProvider {
    static var previews: some View {
        AdivinaLaBanderaView(bandera: Banderas())
    }
}

