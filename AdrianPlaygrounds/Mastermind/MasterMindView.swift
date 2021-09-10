//  MasterMindView.swift
//  AdrianPlaygrounds
//  Created by Adrian Iraizos Mendoza on 9/8/21.
/*
 
 ------>    VIEW  <---------
 
 */
import SwiftUI
import AVFoundation

struct MasterMindView: View {
    @ObservedObject var masterMind = MasterMindViewModel()
    
//    @State private var tipoCanica = .corazones

 //   @State var intentoArray = []
    
    //MARK: TODO cómo dejar solo un juegoCanica Switch

    var juegoCanica: [Character] {
        switch masterMind.canicas {
            case "❤️" : return ["❤️","💛","💚","💜"]
            case "🏋🏻‍♀️" : return ["🏋🏻‍♀️","🤼‍♀️","🤸🏻‍♀️","⛹🏻‍♀️"]
            case "🏈" : return ["⚽️","🏀","🏈","⚾️"]
            case "🐶" : return ["🐶","🐱","🐭","🐰"]
            case "🤖" : return ["😈","👹","💀","🤖"]
            default   : return ["❤️","💛","💚","💜"]
            }
        
    }
    
    let gridItem = [GridItem(.fixed(10)),GridItem(.fixed(30)),GridItem(.flexible(minimum: 60))]
    
    var body: some View {
        VStack{
            Button(action: { masterMind.codigoSecreto = masterMind.crearJuego()}
                   , label: { Text("Empezar")
                   })
                
            //MARK: Código Secreto
            if masterMind.youWin {
            HStack {
                
                ForEach(masterMind.codigoSecreto, id:\.self) { numero in
                    Text("\(String(numero))")
                }.font(.system(size: 60)).shadow(color: .gray, radius: 5, x: 1, y: 1)
                

            }.opacity(masterMind.youWin ? 1 : 0)
            .animation(.easeIn)
            } 
            
            
            // MARK: Histórico de intentos
            ScrollView{
            VStack{
//                ForEach(masterMind.aciertos, id:\.self) { acierto in
//                    Text("\(String(acierto))")
//                    }
             
                ForEach(masterMind.intentos) { intento in
                    HStack{
                        LazyVGrid(columns: gridItem, content: {
                            Text("\(String(intento.id))").foregroundColor(.gray)
                        
                       
                            Text("\(String(intento.aciertos))").font(.caption)
                        
                  
                       
                            Text("\(String(intento.canicas))").font(.largeTitle)
            }
                             )}
            }
            }.padding()
                
                
            }
            //MARK: Parte de abajo
            Spacer()
            HStack{
                
                    Button(action: {
                        masterMind.intentoIndice0 < 3 ?  (masterMind.intentoIndice0 += 1) : (masterMind.intentoIndice0 = 0)
                    }, label: {
                        Text("\(String(juegoCanica[masterMind.intentoIndice0]))")
                    })
                    
                Button(action: {
                    
                    masterMind.intentoIndice1 < 3 ?  (masterMind.intentoIndice1 += 1) : (masterMind.intentoIndice1 = 0)
                }, label: {
                    Text("\(String(juegoCanica[masterMind.intentoIndice1]))")
                })
                
                Button(action: {
                    
                    masterMind.intentoIndice2 < 3 ?  (masterMind.intentoIndice2 += 1) : (masterMind.intentoIndice2 = 0)
                }, label: {
                    Text("\(String(juegoCanica[masterMind.intentoIndice2]))")
                })
                Button(action: {
                    
                    masterMind.intentoIndice3 < 3 ?  (masterMind.intentoIndice3 += 1) : (masterMind.intentoIndice3 = 0)
                }, label: {
                    Text("\(String(juegoCanica[masterMind.intentoIndice3]))")
                })
              
                 
            }.font(.largeTitle)
                Button(action: {
                    
                     masterMind.intento()
                    
                  
                    
                }, label: { Text("Intentar")})
                .disabled(masterMind.gameOver)
        }
        .toolbar{
                            ToolbarItem {
                                Menu("Elige canicas") {
                                    ForEach(masterMind.tiposCanicas, id:\.self) { tipo in
                                        
                                        Button(action: {
                                            
                                            masterMind.canicas = Character(tipo)
                                            masterMind.codigoSecreto = masterMind.crearJuego()
                                        }, label: { Text(tipo)
                                        })
                    }
                                }//.disabled(!masterMind.gameOver)
                            }
        }
    }
}

struct MasterMindView_Previews: PreviewProvider {
    static var previews: some View {
        MasterMindView()
    }
}
