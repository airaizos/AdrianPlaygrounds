//
//  PaginaPrincipal.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 13/7/21.
//

import SwiftUI

struct PaginaPrincipal: View {
    //MARK: ObservedObjects
    @ObservedObject var marcador = Marcador()
    @State private var irAlDetalle = false
    @State private var nivel0 = false
    @State private var nivel1 = false
    @State private var nivel2 = false
    @State private var nivel3 = false
    @State private var nivel4 = false
    @State private var nivel5 = false
    @State private var nivel6 = false
    @State private var nivel7 = false
    @State private var nivel8 = false
    @State private var nivel9 = false
    @State private var nivel10 = false
    @State private var nivel11 = false
    
    //MARK: Colores
    
    let colorPP1 = Color(red: 0.537, green: 0.820, blue: 0.863, opacity: 1.000)
    let colorPP2 = Color(red: 0.973, green: 0.612, blue: 0.980, opacity: 1.000)
    let colorPP3 = Color(red: 0.765, green: 0.525, blue: 0.945, opacity: 1.000)
    let colorPP4 = Color(red: 0.941, green: 0.839, blue: 0.537, opacity: 1.000)
    let colorPP5 = Color(red: 0.686, green: 0.949, blue: 0.545, opacity: 1.000)
    
    //MARK: Página Principal
    
    let cuadrado = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    let miniJuegos:[String] = ["⌨️","🪢","💚💛🧡❤️","📃✂️🦎🖖🏻","🚩","✖️","🔷","🔢","🃏","🎲","🔲","⚙️"]
    
    let titulo = Array("PLAYGROUNDS")
    @State private var tituloArrastrado = false
    @State private var tituloArrastre = CGSize.zero
    
    //MARK: Environment
    
    
    
    
    var body: some View {
        NavigationView {
        ZStack{
            colorPP1.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                
                HStack(spacing: 0) {
                    ForEach(0 ..< titulo.count) {
                        letra in
                        Text(String(titulo[letra]))
                            .padding(8)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .background(tituloArrastrado ? colorPP2 : colorPP4)
                            .clipShape(Circle())
                            .frame(width: 30, height: 40)
                            .offset(tituloArrastre)
                            .animation(Animation.default
                                        .delay(Double(letra) / 20 ))
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { tituloArrastre = $0.translation }
                        .onEnded { _ in
                            tituloArrastre = .zero
                            tituloArrastrado.toggle()
                        }
                    
                )
                Spacer()
                VStack {
                    //Fila 1
                    HStack(spacing: 30) {
                        NavigationLink(
                            destination: BastaView(modelo: JuegoBasta()), isActive: $nivel0){
                            Button(action: { nivel0 = true }) {
                                Text(miniJuegos[0])
                                    .font(.system(size: miniJuegos[0].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                        NavigationLink(
                            destination: AhorcadoView(),
                            isActive: $nivel1) {
                            Button(action: { nivel1 = true }) {
                                Text(miniJuegos[1])
                                    .font(.system(size: miniJuegos[1].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                        NavigationLink(
                            destination: MasterMindView(),
                            isActive: $nivel2) {
                            Button(action: { nivel2 = true }) {
                                Text(miniJuegos[2])
                                    .font(.system(size: miniJuegos[2].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                    }
                    //Fila 2
                    HStack(spacing: 30) {
                        NavigationLink(
                            destination: PiedraPapelView(), isActive: $nivel3){
                            Button(action: { nivel3 = true }) {
                                Text(miniJuegos[3])
                                    .font(.system(size: miniJuegos[3].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                        NavigationLink(
                            destination: AdivinaLaBanderaView(bandera: Banderas()),
                            isActive: $nivel4) {
                            Button(action: { nivel4 = true }) {
                                Text(miniJuegos[4])
                                    .font(.system(size: miniJuegos[4].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                        NavigationLink(
                            destination: SumaRestaMultiplicaView(),
                            isActive: $nivel5) {
                            Button(action: { nivel5 = true }) {
                                Text(miniJuegos[5])
                                    .font(.system(size: miniJuegos[5].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                    }
                    //Fila 3
                    HStack(spacing: 30) {
                        NavigationLink(
                            destination: ObservaLasFiguras(), isActive: $nivel6){
                            Button(action: { nivel6 = true }) {
                                Text(miniJuegos[6])
                                    .font(.system(size: miniJuegos[6].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                        NavigationLink(
                            destination: SeriesDeNumerosView(),
                            isActive: $nivel7) {
                            Button(action: { nivel7 = true }) {
                                Text(miniJuegos[7])
                                    .font(.system(size: miniJuegos[7].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                        NavigationLink(
                            destination: BlackJackView(),
                            isActive: $nivel8) {
                            Button(action: { nivel8 = true }) {
                                Text(miniJuegos[8])
                                    .font(.system(size: miniJuegos[8].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                    }
                    //Fila 4
                    HStack(spacing: 30) {
                        NavigationLink(
                            destination: SumaLosDadosView(), isActive: $nivel9){
                            Button(action: { nivel9 = true }) {
                                Text(miniJuegos[9])
                                    .font(.system(size: miniJuegos[9].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                        NavigationLink(
                            destination: CuadradoMagicoView(),
                            isActive: $nivel10) {
                            Button(action: { nivel10 = true }) {
                                Text(miniJuegos[10])
                                    .font(.system(size: miniJuegos[10].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                        NavigationLink(
                            destination: AjustesView(),
                            isActive: $nivel11) {
                            Button(action: { nivel11 = true }) {
                                Text(miniJuegos[11])
                                    .font(.system(size: miniJuegos[11].count == 1 ? 50 : 29))
                                    .modifier(botonPaginaPrincipal())
                                    .foregroundColor(colorPP1)
                            }
                        }
                    }
                }
                
                Spacer()
                VStack {
                    Text("Puntuación total: \(marcador.puntos)")
                    Text("Racha: \(marcador.racha) ")
                    
                }
                .font(.largeTitle)
                .foregroundColor(Color(red: 1.000, green: 1.000, blue: 1.000, opacity: 1.000))
            }
        }
    }
    }
}

struct PaginaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        
        PaginaPrincipal()
        //            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        //            .previewDisplayName("iPhone 12 Pro Max")
        //
        //        PaginaPrincipal()
        //            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        //            .previewDisplayName("iPhone 8")
        //
        //        PaginaPrincipal()
        //
        //
        //        PaginaPrincipal()
        //            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        //            .previewDisplayName("iPhone 8")
        
        
    }
}






/*
 CÓMO HACER CON EL FOREACH DE MINIJUEGOS UN NAVIGATIONLINK
 
                LazyVGrid(columns: cuadrado, alignment: .center,spacing: 20) {
                    ForEach(miniJuegos, id:\.self) { juego in
                        ZStack {
                            Text(juego)
                                .font(.system(size: juego.count == 1 ? 50 : 29))

                                .font(.title2)
                                .padding(5)
                                .shadow(radius: 10)
                                .frame(width: 100, height: 100)
                                .overlay(Circle()

                                            .stroke(lineWidth: 10))
                                .shadow(radius: 90)
                                .foregroundColor(colorPP1)

                        }
                    }
                }

 */
