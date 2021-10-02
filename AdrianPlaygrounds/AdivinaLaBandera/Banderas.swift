//
//  Banderas.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 17/9/21.
//

import Foundation

class Banderas: ObservableObject {
    
    @Published var paises = ["Estonia","Francia","Alemania","Irlanda","Italia","Nigeria","Polonia","Rusia","España","Reino Unido","EEUU","Sudáfrica","Lesotho","Zambia","Botswana","Angola","Malaui","Namibia","Republica Centroafricana","Antigua y Barbuda","Bahamas","Barbados","Belice","Colombia","Costa Rica","Cuba","Dominica","Granada","Guatemala","Guyana","Haiti","Honduras","Trinidad y Tobago","Surinam","San Vicente y las Granadinas","San Cristobal y Nieves","Republica Dominicana","Panama","Mauritania","Eritrea","Uganda","Togo","Republica Democrática del Congo","Tanzania","Sudan","Senegal","Ruanda","Mali","Kenia","Guinea","Burundi","Burkina Faso","Argelia","Etiopia","Nauru","Fiji","Samoa","Vanuatu","Afganistán","Islas Salomón","Arabia Saudita","Armenia","Islas Marshall","Azerbaiyán","Bangladesh","Barhein","Birmania","Brunei","Bután","Camboya","Qatar","China","Chipre","Corea del Norte","Corea del Sur","Indonesia","Irak","Kazajistán","Kirguistán","Kuwait","Laos","Libano","Malasia","Singapur","Siria","Timor Oriental","Turkmenistán","Tayikistán","Yemen"]
        .shuffled()
    
    @Published var mostrarPuntuacion = false
    @Published var respuestaCorrecta = Int.random(in: 0...3)
    @Published var tituloPuntuacion = ""
    @Published var puntuación = 0
    @Published var racha = 0
    @Published var enJuego = true


    
    /*
     
     @Published var dificultad: nivelDificultad = nivelDificultad.Medio
     
         enum nivelDificultad {
         case Fácil
         case Medio
         case Difícil
     }
     
     Nivel de dificultad
     Facil : Muestra bandera correcta, 3 opciones
     Medio: Muestra bandera correcta, 4 opciones
     Dificil : No muestra bandera correcta, 5 opciones
     
     
     */
    
    func pulsada(_ numero: Int) {
        if numero == respuestaCorrecta {
            tituloPuntuacion = "Correcto"
            puntuación += 1
            racha += 1
            enJuego.toggle()
            print(paises[numero])
        } else {
            tituloPuntuacion = "Incorrecto"
            racha = 0
        }
        mostrarPuntuacion = true
    }
    
    func preguntar() {
        respuestaCorrecta = Int.random(in: 0...3)
        paises.shuffle()
        enJuego.toggle()
        
    }
}
