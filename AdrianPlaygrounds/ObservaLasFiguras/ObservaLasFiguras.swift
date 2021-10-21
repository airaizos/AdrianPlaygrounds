//
//  ObservaLasFiguras.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 2/10/21.
//

//MARK: TODO: Probar. Ocultar respuestas, mejor print. mejorar UI. En el primer intento no muestra el numero 1


import SwiftUI

struct ObservaLasFiguras: View {
    
    @State private var figuras = [Figura]()
    @ObservedObject var adivina = adivinaFiguras()
    @State private var rachaGeometrica = false
    @State private var rachaColor = false
    @State private var mostrarVistaFiguras = false
    @State private var showCorrectoIncorrecto = false
    
    //  Respuestas a las preguntas
    
    @State private var pares = 0
    @State private var impares = 0
    @State private var sumaPares = 0
    @State private var sumaImpares = 0
    @State private var cuentaNumAleatorio = 0
    @State private var sumaNumAleatorio = 0
    @State private var cuentaColor = 0
    @State private var cuentaGeometrica = 0
    @State private var numeroAleatorio = 9
    @State private var numeroAleatorioTres = 1
    @State private var colorString = ""
    @State private var preguntaMostrada = ""
    
    @State private var respuestaRecibida = ""
    @State private var respuestaCorrecta = true
    @State private var mostrarBotonRespuesta = false
    @State private var mostrarBotonMuestraFiguras = true
    @State private var respuestaCorrectaMostrada:Int = 0
    
    // de funciones
    @State private var numeroAleatorioDos = 0
    @State private var numPregunta = 0
    
    // animaciones
    @State private var animacionIconoRespuesta: CGFloat = 1
    
    
    // que hay dentro??
    @State private var numeros = ""
    @State private var geometricas = ""
    @State private var colores = ""
    
    
    var body: some View {
        ScrollView {
        VStack(spacing: 30){
            
            Text("Presta atención a las figuras...")
                .font(.title3)
                .foregroundColor(color4)
                .padding(.top, 10)
            ZStack {
                Capsule()
                    .frame(width: 350, height: 50, alignment: .center)
                    .foregroundColor(mostrarBotonMuestraFiguras ? color4 : .gray)
                Button("Muéstrame \(adivina.racha == 0 ? "" : "más ")\(adivina.racha < 7 ? "números": "figuras")") {
                    
                    // Oculta la vista de figuras
                    mostrarVistaFiguras = false
                    
                    // Borra respuestas
                    limpiarRespuestas()
                    
                    // Crea figuras aleatorias en un array
                    adivina.agregaFiguras()
                    
                    // Mostrar u ocultar el figuras y el color cuando se va acumulando puntos en la racha
                    rachaGeometrica = adivina.racha > 6 ? true : false
                    rachaColor = adivina.racha > 12 ? true : false
                    
                    respuestas()
                    // preguntaMostrada = pregunta()
                    
                    mostrarVistaFiguras = true
                    showCorrectoIncorrecto = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) { mostrarVistaFiguras = false  }
                    mostrarBotonRespuesta = true
                    mostrarBotonMuestraFiguras = false
                    animacionIconoRespuesta = 1
                }
                .disabled(!mostrarBotonMuestraFiguras)
                .font(.title)
                .foregroundColor(.white)
                
                
            }
            //Seguro hay una mejor manera de hacer esto por cada uno..
            
            if mostrarVistaFiguras {
                VStack {
                    HStack {
                        if adivina.racha >= 0 {
                            FiguraView(figura:.init(numero: adivina.figuras[0].numero, geometrica:  adivina.figuras[0].geometrica, color: adivina.figuras[0].color), rachaGeometrica: rachaGeometrica, rachaColor: rachaColor, racha: adivina.racha)
                        }
                        if adivina.racha >= 2 {
                            FiguraView(figura:.init(numero: adivina.figuras[1].numero, geometrica:  adivina.figuras[1].geometrica, color: adivina.figuras[1].color), rachaGeometrica: rachaGeometrica, rachaColor: rachaColor, racha: adivina.racha)
                        }
                        if adivina.racha >= 3 {
                            FiguraView(figura:.init(numero: adivina.figuras[2].numero, geometrica:  adivina.figuras[2].geometrica, color: adivina.figuras[2].color), rachaGeometrica: rachaGeometrica, rachaColor: rachaColor, racha: adivina.racha)
                        }
                    }
                    HStack {
                        if adivina.racha >= 4 {
                            FiguraView(figura:.init(numero: adivina.figuras[3].numero, geometrica:  adivina.figuras[3].geometrica, color: adivina.figuras[3].color), rachaGeometrica: rachaGeometrica, rachaColor: rachaColor, racha: adivina.racha)
                        }
                        if adivina.racha >= 5 {
                            FiguraView(figura:.init(numero: adivina.figuras[4].numero, geometrica: adivina.figuras[4].geometrica, color: adivina.figuras[4].color), rachaGeometrica: rachaGeometrica, rachaColor: rachaColor, racha: adivina.racha)
                        }
                        if adivina.racha >= 6 {
                            FiguraView(figura:.init(numero: adivina.figuras[5].numero, geometrica:  adivina.figuras[5].geometrica, color: adivina.figuras[5].color), rachaGeometrica: rachaGeometrica, rachaColor: rachaColor, racha: adivina.racha)
                        }
                    }
                    
                }
            } else {
                Text("")
                    .font(.footnote)
            }
            
            if mostrarVistaFiguras {
                Text("")
            } else {
                Text(preguntaMostrada)
                    .font(.title)
                    .frame(width: 300, height: 100, alignment: .center)
                    
                
                TextField("Respuesta", text: $respuestaRecibida)
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(color1, lineWidth: 2))
                    .padding(.horizontal, 100)
                    .keyboardType(.numberPad)
                
                
                ZStack {
                
                    LinearGradient(gradient: Gradient(colors: mostrarBotonRespuesta ? [color1,color2] : [.gray, .white]), startPoint: .top, endPoint: .bottom)
                        .frame(width: 350, height: 50, alignment: .center)
                        .cornerRadius(25)
                    
                    Button("Creo que esa es la respuesta") {
                        //poner identifica la pregunta
                        respuestaCorrecta = identificaPregunta()
                        showCorrectoIncorrecto = true
                        mostrarVistaFiguras = false
                        mostrarBotonMuestraFiguras = true
                        mostrarBotonRespuesta = false
                        animacionIconoRespuesta += 1
                    }
                    .disabled(!mostrarBotonRespuesta)
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding()
                }
                
            }
            // Respuesta
            
            //MARK:TODO Animación a la respuesta
            if showCorrectoIncorrecto {
                Text("\(respuestaCorrecta ? "✅":"❌")")
                    .foregroundColor(respuestaCorrecta ? .blue : .red)
                    .font(.system(size: 60))
            } else {
                Text("")
            }
            if !respuestaCorrecta {
                VStack {
                Text("la respuesta correcta es")
                Text("\(respuestaCorrectaMostrada)")
                }
                .font(.title3)
                .foregroundColor(.red)
            }
            
            Text("Racha \(adivina.racha)")
                .font(.largeTitle)
                .foregroundColor(.gray)
        }
        .navigationBarTitle("Observa Las Figuras", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: iniciarJuego) {
                            Text("Iniciar")
                            })
    }
    }
    
    func iniciarJuego() {
        adivina.racha = 0
        limpiarRespuestas()
        mostrarVistaFiguras = false
        showCorrectoIncorrecto = false
        mostrarBotonMuestraFiguras = true
        mostrarBotonRespuesta = false
        preguntaMostrada = ""
        
    }
    
    func limpiarRespuestas() {
        adivina.figuras = [Figura]()
        
        pares = 0
        impares = 0
        sumaPares = 0
        sumaImpares = 0
        cuentaNumAleatorio = 0
        cuentaColor = 0
        cuentaGeometrica = 0
        sumaNumAleatorio = 0
        respuestaRecibida = ""
        respuestaCorrecta = true
        
        numeros = ""
        geometricas = ""
        colores = ""
    }
    
    func respuestas() {
        
        numeroAleatorio = Int.random(in: 1...9)
        numeroAleatorioTres = Int.random(in: 0...2)
        colorString = adivina.colores[numeroAleatorioTres] == Color.red ? "rojo" :adivina.colores[numeroAleatorioTres] == Color.blue ? "azul" : "amarillo"
        
        for fig in adivina.figuras {
            
            //  coincide con el número aletorio?
            if numeroAleatorio == fig.numero {
                cuentaNumAleatorio += 1
                sumaNumAleatorio += fig.numero
            }
            // geométrica
            
            if fig.geometrica == adivina.geometricas[numeroAleatorioTres] {
                cuentaGeometrica += 1
            }
            
            // colores
            if fig.color == adivina.colores[numeroAleatorioTres] {
                cuentaColor += 1
            }
            
            // son pares?
            if fig.numero % 2 == 0 {
                pares += 1
                sumaPares += fig.numero
                
            } else {
                impares += 1
                sumaImpares += fig.numero
            }
            
            //para mostrar en pantalla cuántos son
            numeros.append(String("\(fig.numero),"))
            geometricas.append(String("\(fig.geometrica),"))
            colores.append(String("\(fig.color),"))
            
        }
        preguntaMostrada = pregunta()
        
        // mostrar respuestas consola
        print("Pares:\(pares) \n Impares \(impares) \nsumaPares: \(sumaPares) \nsumaImpares: \(sumaImpares) \naleatorio: \(numeroAleatorio)  - cuentaRand: \(cuentaNumAleatorio) - sumaRand: \(sumaNumAleatorio)" )
        print("Geometrica \(adivina.geometricas[numeroAleatorioTres]): \(cuentaGeometrica)\n Colores \(colorString):\(cuentaColor)")
        
        print("numeros: \(String(numeros))\nGeométricas: \(String(geometricas))\nColores: \(String(colores))")
        
    }
    
    func pregunta() -> String {
        //     let numeroAleatorioDos = Int.random(in: 0...1)
        numeroAleatorioDos = Int.random(in: 0...1)
        
        let pares = numeroAleatorioDos == 0 ? "pares" : "impares"
        
        //traduce de SFSymbols a la pregunta
        let geometrica = adivina.geometricas[numeroAleatorioTres] == "Circle" ? "círculos" : adivina.geometricas[numeroAleatorioTres] == "Square" ? "cuadrados" : "triángulos"
        
        let TodasLasPreguntas = [
            0:"¿Cuántos números son \(pares)? ",
            1:"¿Cuál es la suma de todos los números \(numeroAleatorio)?",
            2:"¿Cuántos números \(numeroAleatorio) hay?",
            3:"¿Cuántos son \(geometrica)?",
            4:"¿Cuántas figuras son de color \(colorString)?"]
        
        // dependiendo de la racha tiene que mostrar cada tipo de pregunta
        numPregunta = adivina.racha <= 6 ? numeroAleatorioTres : adivina.racha <= 12 ? Int.random(in: 0...3) : Int.random(in: 0...4)
        
        
        return TodasLasPreguntas[numPregunta]!
    }
    
    func identificaPregunta() -> Bool {
        
        let respuestaInt = Int(respuestaRecibida) != nil ? Int(respuestaRecibida)! : 0
        
        if numPregunta == 0 {
            //  P0 : Pares o Impares
            switch (numPregunta,numeroAleatorioDos) {
            case (0, 0):
                respuestaCorrecta = (respuestaInt == pares) ? true : false
                respuestaCorrectaMostrada = pares
            case (0, 1):
                respuestaCorrecta = (respuestaInt == impares) ? true : false
                respuestaCorrectaMostrada = impares
            default:
                respuestaCorrecta = false
            }
        } else {
            
            switch numPregunta {
            case 1:
                respuestaCorrecta = respuestaInt == sumaNumAleatorio ? true : false
                respuestaCorrectaMostrada = sumaNumAleatorio
            case 2:
                respuestaCorrecta = respuestaInt == cuentaNumAleatorio ? true : false
                respuestaCorrectaMostrada = cuentaNumAleatorio
            case 3:
                respuestaCorrecta = respuestaInt == cuentaGeometrica ? true : false
                respuestaCorrectaMostrada = cuentaGeometrica
            case 4:
                respuestaCorrecta = respuestaInt == cuentaColor ? true : false
                respuestaCorrectaMostrada = cuentaColor
            default:
                break
            }
        }
        
        // si es correcta añade 1 a la racha, sino quita 1
        if respuestaCorrecta {
            adivina.racha += 1
        }
        
        return respuestaCorrecta
    }
    
}





struct ObservaLasFiguras_Previews: PreviewProvider {
    static var previews: some View {
        ObservaLasFiguras()
    }
}

