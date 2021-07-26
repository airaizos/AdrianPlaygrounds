//
//  PiedraPapelView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 25/7/21.
//

import SwiftUI
import AVFoundation

struct PiedraPapelView: View {
    
    @State private var escalaAnimacion:[Double] = [0,0,0,0,0]
  @State private var idCarta = 0
    

    
    
    @ObservedObject var partida = PiedraPapel()
    
    let gridScore = [GridItem(.fixed(10))]
    
    var phoneColor = Color(red: 1, green: 0.184, blue: 0.663, opacity: 1)
    
    var humanColor = Color(red: 0.980, green: 0.729, blue: 0.380, opacity: 1)
    
    @State private var scorePuntosPhone = 0
    @State private var pieza = ""
    @State private var ganador = ""
    
    var scoreTablePhone = ["Phone","SET","JUEGO","puntos"]
    var scoreTableHuman = ["Human","SET","JUEGO","puntos"]
    
    var body: some View {
        VStack{
            // MARK: Score
            Button("Reiniciar"){
                
                partida.start()
           
            }
            Section{
                VStack(alignment: .leading, spacing: nil){
                    
                    LazyHGrid(rows: gridScore, alignment: .center, spacing: 45) {
                        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                          
                            Text("Phone")
                            Text("Humano").foregroundColor(humanColor)
                            
                        }
                        
                        VStack{
                            Text("Set").foregroundColor(.gray).font(.footnote)
                            Text("\(partida.setPhone)")
                            Text("\(partida.setHumano)").foregroundColor(humanColor)
                        }
                        VStack{
                            Text("Juego").foregroundColor(.gray).font(.footnote)
                            Text("\(partida.juegoPhone)")
                            Text("\(partida.juegoHumano)").foregroundColor(humanColor)
                        }
                        VStack{
                            Text("Puntos").foregroundColor(.gray).font(.footnote)
                            Text("\(partida.scorePuntosPhone)")
                            Text("\(partida.scorePuntosHuman)").foregroundColor(humanColor)
                        }
                    }.foregroundColor(phoneColor)
                    .shadow(radius: 5)
                    .font(.system(size: 30, weight: .heavy))
                }
                
            }
            
            // MARK: TODO: animar pasando todas las characters
            
            //MARK: PHONE
            
            
            PiedraPapelCircle(pieza: partida.phone, color: phoneColor, axis: [1,1,1],escalaAnimacion: [escalaAnimacion[partida.idCarta]])
                .padding()
            
            //MARK: Texto
            
            Text("\(partida.ganador)")
               
                .animation(Animation.linear)
                .font(.system(size: 20, weight: .bold))
                
            
            // MARK: HUMANO
            
                ZStack{
                PiedraPapelCircle(pieza: partida.humano,color: humanColor, axis: [0,1,0],escalaAnimacion: [escalaAnimacion[partida.idCarta]])
            }
            
            
            // MARK: BOTONES HUMANO
            HStack{
                //                Button("Tap Me"){
                //                    self.escalaAnimacion += 1
                //                }
               // MARK: TODO: Giran todos con el ForEach. STRUCT CON i?
//                ForEach (partida.cartas, id:\.self) {  carta in
//
//
//                    Button("\(carta)") {
//
//                        partida.puntoJugado(humanoB: "\(carta)")
//                        withAnimation{
//                            self.escalaAnimacion[0] += 360
//
//                        }
//                    }.rotation3DEffect(.degrees(escalaAnimacion[0]), axis: (x: 0, y: 1, z: 0))
//
//                }

                Button("✊🏼") {
                    partida.puntoJugado(humanoB: "✊🏼")
                    
                    withAnimation{
                        self.escalaAnimacion[0] += 360
                    }
                }.rotation3DEffect(.degrees(escalaAnimacion[0]), axis: (x: 0, y: 1, z: 0))
                
                Button("✋🏼") {
                    partida.puntoJugado(humanoB: "✋🏼")
                    
                    withAnimation{
                        self.escalaAnimacion[1] += 360
                    }
                }.rotation3DEffect(.degrees(escalaAnimacion[1]), axis: (x: 0, y: 1, z: 0))
                
                Button("✌🏼") {
                    partida.puntoJugado(humanoB: "✌🏼")
                   
                    withAnimation{
                        self.escalaAnimacion[2] += 360
                    }
                }.rotation3DEffect(.degrees(escalaAnimacion[2]), axis: (x: 0, y: 1, z: 0))
                Button("🦎") {
                    partida.puntoJugado(humanoB: "🦎")
                   
                    withAnimation{
                        self.escalaAnimacion[3] += 360
                    }
                }.rotation3DEffect(.degrees(escalaAnimacion[3]), axis: (x: 0, y: 1, z: 0))
                
                Button("🖖🏽") {
                    partida.puntoJugado(humanoB: "🖖🏽")
                    
                    withAnimation{
                        self.escalaAnimacion[4] += 360
                    }
                }.rotation3DEffect(.degrees(escalaAnimacion[4]), axis: (x: 0, y: 1, z: 0))
            }
            .font(.system(size: 50))
            Spacer()
            
        }
    }
}

struct PiedraPapelView_Previews: PreviewProvider {
    static var previews: some View {
        PiedraPapelView()
    }
}
