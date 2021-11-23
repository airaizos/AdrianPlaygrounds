//
//  SumaRestaMultiplicaModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 3/10/21.
//

import Foundation

class Operaciones: ObservableObject {
    //  MARK: Variables
    @Published var resultado = 0
    @Published var intento = 0
    @Published var operadores = ["➕","➖","✖️"]

    @Published var operador0 = "❔"
    @Published var operador1 = "❔"
    @Published var operador2 = "❔"
    
    @Published var string1 = ""
    @Published var string2 = ""
    @Published var string3 = ""
    @Published var string4 = ""
    
    //  Marcador
    @Published var puntos = 0
    @Published var racha  = 0
    var intentoErroneo = false
    
    var numero1 = 0
    var numero2 = 0
    var numero3 = 0
    var numero4 = 0
   
    var temporal1 = 0
    var temporal2 = 0
    
    // MARK: Nuevo
    //  Nuevo resultado a obtener
    func nuevoJuego() {
        resultado = Int.random(in: 101...1_000)
        print(resultado)
       
        func operadorRandom() -> Int {
            return Int.random(in: 0 ..< operadores.count)
        }
        
        operador0 = operadores[operadorRandom()]
        print(operador0)
        operador1 = operadores[operadorRandom()]
        print(operador1)
        operador2 = operadores[operadorRandom()]
        print(operador2)
        
        string1 = ""
        string2 = ""
        string3 = ""
        string4 = ""
        intento = 0
    }
    
    // MARK: Botón Voy a tener suerte
    
    //  Hacer la operacion
    //  Primero multiplicaciones
    func calcular() {

        let stringOperadores = "\(operador0 == "✖️" ? "*" : "±")\(operador1 == "✖️" ? "*" : "±")\(operador2 == "✖️" ? "*" : "±")"
    
        numero1 = Int(string1) != nil ? Int(string1)! : 0
        numero2 = Int(string2) != nil ? Int(string2)! : 0
        numero3 = Int(string3) != nil ? Int(string3)! : 0
        numero4 = Int(string4) != nil ? Int(string4)! : 0
        
      
        //MARK: Casos
    /*
        Caso    ✖️  ✖️  ✖️    : 0️⃣ * 1️⃣ * 2️⃣ * 3️⃣     ->  0 * 1 * 2 * 3
        Caso     ±  ✖️  ✖️    : 0️⃣ ± 1️⃣ x 2️⃣ x 3️⃣     -> 1º (2x3) x 1) ± 0
        Caso     ±   ±  ✖️    : 0️⃣ ± 1️⃣ ± 2️⃣ x 3️⃣     -> 1º (2 x 3) then 6 ± 1 ± 0
        Caso     ±   ±   ±    : 0️⃣ ± 1️⃣ ± 2️⃣ ± 3️⃣     -> 0 ± 1 ± 2± 3
        Caso    ✖️   ±   ±    : 0️⃣ x 1️⃣ ± 2️⃣ ± 3️⃣     -> 1º (0x1) ± 2± 3
      -  Caso    ✖️  ✖️   ±    : 0️⃣ x 1️⃣ x 2️⃣ ± 3️⃣     -> 1º ((0x1) x 2) ± 3
        Caso    ✖️   ±  ✖️    : 0️⃣ x 1️⃣ ± 2️⃣ x 3️⃣     -> 1º (2 x 3) y 2º (0 x 1) then 6 ± 0
        Caso     ±  ✖️   ±    : 0️⃣ ± 1️⃣ x 2️⃣ ± 3️⃣     -> 1º (1x2) ± 0) ± 1
        */
        //["➕","➖","✖️"]
        
        switch stringOperadores {
        
        case "***":
            intento = numero1 * numero2 * numero3 * numero4
    
        case "±**":
            temporal1 = numero2 * numero3 * numero4
            intento = operador1 == "➕" ?  numero1 + temporal1 : numero1 - temporal1
            
        case "±±*":
            temporal1 = operador0 == "➕" ? numero1 + numero2 : numero1 - numero2
            temporal2 = numero3 * numero4
            intento = operador1 == "➕" ? temporal1 + temporal2 : temporal1 - temporal2
            
        case "±±±":
            temporal1 = operador0 == "➕" ? numero1 + numero2 : numero1 - numero2
            temporal2 = operador1 == "➕" ? temporal1 + numero3 : temporal1 - numero3
            intento = operador2 == "➕" ? temporal2 + numero4 : temporal2 - numero4
        
        case "*±±":
            temporal1 = numero1 * numero2
            temporal2 = operador1 == "➕" ? temporal1 + numero3 : temporal1 - numero3
            intento = operador2 == "➕" ? temporal2 + numero4 : temporal2 - numero4
            
        case "**±":
            temporal1 = numero1 * numero2 * numero3
            intento = operador2 == "➕" ? temporal1 + numero4 : temporal1 - numero4
            
        case "*±*":
            intento = operador1 == "➕" ? numero1 * numero2 + numero3 * numero4 : numero1 * numero2 - numero3 * numero4
            
        case "±*±":
            temporal1 = numero2 * numero3
            temporal2 = operador0 == "➕" ? numero1 + temporal1 : numero1 - temporal1
            intento = operador2 == "➕" ? temporal2 + numero4 : temporal2 - numero4
                  
        default:
            intento = 999_999
        }
        
        // Añadir puntos
        
        if resultado == intento {
            puntos += 1
            racha += 1
            intentoErroneo = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.80) {
                self.nuevoJuego()
            }
            
        } else {
            racha = 0
            intentoErroneo = true
        }
        
        }
}

