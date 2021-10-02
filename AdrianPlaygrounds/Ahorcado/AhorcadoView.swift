//
//  AhorcadoView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 15/7/21.
//

import SwiftUI

struct AhorcadoView: View {
    @ObservedObject var ahorcado =  Ahorcado()
    @State private var letras = ""
    @State private var turnoLetra = ""
    @State private var palabra: NSString = ""
    @State private var lineasYLetras = [Character]()
    @State private var intentoPalabra = ""
    @State private var imagenStrikes = "Ahorcado_0"
    @State private var strikes = 0
    @State private var dificultadElegida = 1
    @State private var cuentaVocales = 0
    @State private var conVocales = true
    @State private var pidoVocal = false
    @State private var sinVocales = true
    @State private var tienesVocales = true
    
    
    var body: some View {
        
        VStack{
            
            // MARK: Nivel de Dificultad
            Section(header: Text("Nivel de dificultad")){
                Picker("Dificultad:", selection: $ahorcado.dificultadElegida) { ForEach(0..<ahorcado.nivelDificultad.count){
                    Text("\(ahorcado.nivelDificultad[$0])")
                }
                }.pickerStyle(SegmentedPickerStyle())
                // MARK: Botón empezar
            }.padding(5)
            .disabled(ahorcado.jugando)
            Button(action: {
                
                ahorcado.empezar()
            }
            
            , label: {
                Text("Empezar")
                    .frame(maxWidth: 100, maxHeight: 30, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 90))
                    .shadow(radius: 10)
                    .padding(.bottom, 10)
                
            })
            
            //MARK: lineas y letras + Intentos
            HStack{
                if ahorcado.palabraAcertada || ahorcado.gameOver {
                    
                    Text("\(ahorcado.palabra)")
                    
                } else {
                    ForEach(ahorcado.lineasYLetras, id:\.self) { letra in
                        Text("\(String(letra))")
                    }
                    
                    
                }
            }.font(.system(size: 30))
            
            Group {
                
                HStack {
                    Text("Intentos: \(ahorcado.strikes) de 6")
                        .foregroundColor(ahorcado.strikes <= 2 ? .green : ahorcado.strikes <= 4 ? .yellow : .red)
                        .padding(10)
                    
                    Text("Vocales \(ahorcado.cuentaVocales) de \(ahorcado.dificultadElegida)")
                        .foregroundColor(ahorcado.dificultadElegida == 0 ? .red : ahorcado.tienesVocales ? .green  : .red)
                        .padding(10)
                    
                }
            }
            // MARK: Imagen ahorcado 0 - 6
            
            Image("\(ahorcado.imagenStrikes)")
                .resizable()
                .scaledToFit()
               
            VStack {
                
                // MARK: Botón Pido letra
                
                HStack{
                TextField("Escribe una letra", text: $turnoLetra)
                    .textCase(.uppercase)
                    .background(Color( red: 44, green: 0.11, blue: 0.22, opacity: 0.33))
                    .font(.system(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                
                    Button(action: {
                        withAnimation (
                            .interpolatingSpring(stiffness: 5, damping: 2)) {
                            
                        ahorcado.pidoLetra(letraR: turnoLetra[turnoLetra.index(turnoLetra.startIndex, offsetBy: 0)])
                        turnoLetra = ""
                            }
                        
                    })  {
                        Image(systemName: "square.and.arrow.down")
                       
                        
                        //MARK: Las alertas no funcionan
                        
                    } .frame(width: 80, height: 30, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(radius: 15)
                    .font(.system(size: 20, weight: .bold))
                    
                    .alert(isPresented: $ahorcado.gameOver, content: {
                        Alert(title:
                                Text("¡Has sido Ahorcado!"), message: Text("Inténtalo de nuevo"),
                              primaryButton: .default(Text("Intento"),
                                                      action: ahorcado.ultimoIntento), secondaryButton: .destructive(Text("Empezar de nuevo"),
                                                                                                                     action: ahorcado.empezar))
                        
                        
                    })
                    .alert(isPresented: $ahorcado.sinVocales, content: {
                        Alert(title:
                                Text("Te has quedado sin vocales"), message: Text("Inténtalo de nuevo"))
                    })
                    
                } .padding()
                
                    //MARK: Botón pido palabra
                    HStack {
                    TextField("¿Que palabra es?", text: $intentoPalabra)
                        .textCase(.uppercase)
                        .background(Color(red: 0.11, green: 0.44, blue: 0.22, opacity: 0.2))
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        ahorcado.pidoPalabra(conR: intentoPalabra)
                        
                        intentoPalabra = ""
                        
                    }) { Image(systemName: "arrowshape.zigzag.right")
                    }.frame(width: 80 , height: 30, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(radius: 15)
                   
                    .alert(isPresented: $ahorcado.palabraAcertada, content: {
                        Alert(title: Text("Te has salvado. Has adivinado la palabra"), message: Text("Jugar de nuevo"))
                    })
                    }.padding()
                .disabled(ahorcado.gameOver || turnoLetra.isEmpty || pidoVocal)
                
            }.disabled(ahorcado.jugando == false || ahorcado.gameOver)
            
            
        }
    }
}

//añadir una vista de fin de juego

struct AhorcadoView_Previews: PreviewProvider {
    static var previews: some View {
        AhorcadoView()

    }
}
