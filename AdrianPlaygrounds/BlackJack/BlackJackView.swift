//
//  BlackJackView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 2/10/21.
//

/*
 Turno:
 0: Juego no iniciado
 1. Se preparan las cartas
 2. Se reparte al jugador 1, luego al crupier 2, luego al jugador 3, y luego al crupier 4(oculta)
 
 3. el jugador puede:
 3A: pedir carta
 3B: puede pasar
 4. el crupier recibe cartas
 4A: hasta sumar 17 donde se tendria que plantar.
 5. si el crupier se pasa de 21 pierde y gana el jugador. si el crupier suma mas que el jugador el crupier gana
 
 
 CARTAS
 CRUPIER : 2 - 4 - n
 JUGADOR: 1 - 3 - 5 ... hasta total > 21
 */

import SwiftUI
import AVKit

struct BlackJackView: View {
    @State private var baraja = createDeckCars(cards: cards, suit: suit)
    
    @State private var turno = 0
    let radio:CGFloat = 3
    let contorno:CGFloat = 3
    let ancho:CGFloat = 7
    let largo:CGFloat = 4
    
    @State private var totalJugador = 0
    @State private var totalCrupier	 = 0
    
    @State private var barajaCrupier: [String] = []
    @State private var barajaJugador: [String] = []
    @State private var cartasJugador = 2
    @State private var cartasCrupier = 2
    @State private var numeroCarta = 4
    
    @State private var jugadorSePlanta = false
    @State private var pierdeJugador = false
    @State private var pierdeCrupier = false
    @State private var empate = false
    @State private var disableDameCarta = false
    
    @State private var finPartida = false
    
    @State private var partidasPerdidas = 0
    @State private var partidasGanadas = 0
    
    //MARK: Animaciones
    @State private var escalaEfecto:CGFloat = 1
    @State var player: AVAudioPlayer?
    
    var body: some View {
        VStack {
            
            Button(action: {
                resetBlackJack()
                
                turno = 2
                
                //repartir cartas 1º jugador, 2º crupier ,3º jugador, 4º crupier (oculta
                totalJugador = laCuentaJugador(cartas: barajaJugador)
                totalCrupier = laCuenta(cartas: [baraja[2],
                                                 baraja[4]])
                
                //MARK: Comprobación
                for c in 1...10 {
                    print("\(c): \(baraja[c])")
                }
                print("jugador \(baraja[1]) - \(baraja[3])")
                print("croupier \(baraja[2]) - \(baraja[4])")
                print("Crupier: \(totalCrupier)")
                print("Jugador: \(totalJugador)")
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, lineWidth: 1)
                        .shadow(color: .black, radius: 2, x: 1, y: 1)
                        .frame(width: 110, height: 50)
                    Text("Iniciar")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .green, radius: 1, x: 1, y: 1)
                }.padding(10)
            })
            
            VStack {
            Text("Crupier")
                .foregroundColor(.yellow)
                .font(.largeTitle)
                .bold()
                .shadow(color: .black, radius: 1, x: 1, y: 0)
            
            Text("\(totalCrupier)")
                .opacity(finPartida ? 1 : 0)
                .foregroundColor(.yellow)
                .font(.title2)
                .shadow(color: .black, radius: 1, x: 1, y: 0)
            }
            //MARK: CARTAS CRUPIER
            GeometryReader { proxy in
                HStack{
                    if turno < 2 {
                        
                    
                } else if turno < 4 {
                        CardView(carta: "\(baraja[2])")
                            .background(Color.white)
                        CardView(carta: "")
                            .background(Color.black)
                    } else {
                    
                    ForEach(barajaCrupier, id:\.self) { carta in
                        CardView(carta: carta)
                            .background(Color.white)
                    }
                    }
                }.padding()
                    .frame(width: 350, height: 150)
            }
            //MARK: Mensaje Fin de Partida
            //MARK: TODO Animaciones
            VStack {

                Text("\(empate ? "EMPATE" : pierdeJugador ? "CRUPIER GANA" : "JUGADOR GANA")")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .scaleEffect(escalaEfecto)
                    .animation(
                            Animation.easeIn(duration: 1)
                    .repeatCount(9, autoreverses:true))

            }.opacity(finPartida ? 1 : 0)

            Spacer()
            VStack {
                Text("Jugador")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .bold()
                    .shadow(color: .black, radius: 1, x: 1, y: 0)
                Text("\(totalJugador)")
                    .opacity(finPartida ? 1 : 0)
                    .foregroundColor(.red)
                    .font(.title2)
                    .shadow(color: .black, radius: 1, x: 1, y: 0)
                
            }
            //MARK: CARTAS JUGADOR
            //MARK: TODO: Con 5 cartas se sale de la pantalla
            GeometryReader { proxy in
                HStack{
                    ForEach(barajaJugador, id:\.self) { carta in
                        CardView(carta: carta)
                            .background(Color.white)
                    }

                }.padding()
                    .frame(width: 350, height: 150)
            }
            //MARK: Botones
            HStack {
         //MARK: Dame Carta
                Button(action: {
                    
                    //sonido
                    player = try! AVAudioPlayer(contentsOf: URL(string: Bundle.main.path(forResource: "dameCarta", ofType: "wav")!)!)
                    //añadir carta y sumar puntos

                    turno = 3
                    cartasJugador += 1
                    //sumar cartas
                    numeroCarta += 1
                    barajaJugador.append(baraja[numeroCarta])
                    totalJugador = laCuentaJugador(cartas: barajaJugador)
                    print("jugador + \(barajaJugador)")

                    // si la suma es mas de 21 jugador Pierde y bloquea boton
                    if totalJugador > 21 {
                        pierdeJugador = true
                        partidasPerdidas += 1
                        finPartida = true
                        turno = 4
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1)
                            .shadow(color: .black, radius: 2, x: 1, y: 1)
                            .frame(width: 150, height: 50)
                        Text("Dame Carta")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(color: .green, radius: 1, x: 1, y: 1)
                    }.padding(10)
                })
                    .disabled(disableDameCarta || finPartida)
                Spacer()
                VStack {
                Text("G \(partidasGanadas)")
                Text("P \(partidasPerdidas)")
                }
                .font(.subheadline)
                    .foregroundColor(.white)
                Spacer()
                //MARK: Me Planto
                Button(action: {
                    //sonido
                    player = try! AVAudioPlayer(contentsOf: URL(string: Bundle.main.path(forResource: "finPartida", ofType: "wav")!)!)
                    
                    //Mostrar carta oculta Crupier
                    turno  = 4
                    
                    // si jugador = 21 fin & tiene menos cartas que el crupier
                    if totalJugador == 21 && barajaJugador.count < barajaCrupier.count {
                        pierdeJugador = false
                        pierdeCrupier = true
                        partidasGanadas += 1
                        finPartida = true
                        escalaEfecto *= 1.3
                    }
                                     
                    disableDameCarta = true
                    
                    //dar cartas al crupier
                    while totalCrupier < 17 {
                        numeroCarta += 1
                        barajaCrupier.append(baraja[numeroCarta])
                        totalCrupier = laCuenta(cartas: barajaCrupier)
                        
                        print("total crupier\(totalCrupier)")
                        print("Crupier: \(barajaCrupier)")
                    }
                    
                    if totalCrupier < totalJugador || totalCrupier > 21 {
                        pierdeJugador = false
                        pierdeCrupier = true
                        partidasGanadas += 1
                        finPartida = true
                        escalaEfecto *= 1.3
                    } else if totalCrupier > totalJugador || totalJugador > 21 {
                        pierdeCrupier = false
                        pierdeJugador = true
                        partidasPerdidas += 1
                        finPartida = true
                        escalaEfecto *= 1.3
                    } else {
                        empate = true
                        finPartida = true
                        escalaEfecto *= 1.3
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, lineWidth: 1)
                            .shadow(color: .black, radius: 2, x: 1, y: 1)
                            .frame(width: 120, height: 50, alignment: .center)
                        Text("Me planto")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(color: .green, radius: 1, x: 1, y: 1)
                    }.padding(10)
                }).disabled(finPartida)
                    
            }
            .navigationBarTitle("BlackJack", displayMode: .inline)
            //Alerta fin del juego
        }.background(Color(red: 0.345, green: 0.424, blue: 0.361, opacity: 1.000))
        
    }
    
    func resetBlackJack() {
        baraja = createDeckCars(cards: cards, suit: suit)
        barajaJugador = [baraja[1],baraja[3]]
        barajaCrupier = [baraja[2],baraja[4]]
        totalJugador = 0
        totalCrupier = 0
        cartasJugador = 2
        cartasCrupier = 2
        numeroCarta = 4
        pierdeJugador = false
        pierdeCrupier = false
        disableDameCarta = false
        finPartida = false
        escalaEfecto = 1
        empate = false
    }
}

struct BlackJackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackJackView()
    }
}


