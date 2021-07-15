//
//  DNIModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 14/7/21.
//

import SwiftUI
import Foundation

class Dni: ObservableObject {
    var letra = ["T","R","W","A","G","M","Y","F","P","D","X","B","N","J","Z","S","Q","V","H","L","C","K","E"]
    
    @Published  var numerosDNI = ""
    @Published  var dniNoValido = false
    @Published  var dniLetra = ""
    @Published var digitosValidado = 0
    @Published var resultadoDNI = ""
    @Published var esNIE = false
    @Published var numerosNIE = ""
    @Published var prefijoNIE = ""
    @Published var digitosNIE = ""
    @Published var showInfo = false
    
    func validaDNI(digitos: String) -> String {
        var resultadoDNI = ""
        numerosNIE = digitos.uppercased()
        if esNIE && (numerosNIE.hasPrefix("X") || numerosNIE.hasPrefix("Y") || numerosNIE.hasPrefix("Z")) && digitos.count == 8 {
           
            
            let range = numerosNIE.startIndex..<numerosNIE.index(after: numerosNIE.startIndex)
            
            // MARK: TODO: Quitar ese código repetido
            if  numerosNIE.hasPrefix("X") {
                numerosNIE = numerosNIE.replacingOccurrences(of: "X", with: "0")
                prefijoNIE = "X"
                digitosNIE = numerosNIE.replacingCharacters(in: range, with: "X")
                dniNoValido = false
                
                digitosValidado = Int(numerosNIE)!
                dniLetra = letra[digitosValidado % 23]
                resultadoDNI = "\(String(digitosNIE))\(dniLetra)"
                
            } else if numerosNIE.hasPrefix("Y") {
                numerosNIE = numerosNIE.replacingOccurrences(of: "Y", with: "1")
                prefijoNIE = "Y"
                digitosNIE = numerosNIE.replacingCharacters(in: range, with: "Y")
                dniNoValido = false
                
                digitosValidado = Int(numerosNIE)!
                dniLetra = letra[digitosValidado % 23]
                resultadoDNI = "\(String(digitosNIE))\(dniLetra)"
                
            } else if numerosNIE.hasPrefix("Z") {
                numerosNIE = numerosNIE.replacingOccurrences(of: "Z", with: "2")
                prefijoNIE = "Z"
                digitosNIE = numerosNIE.replacingCharacters(in: range, with: "Z")
                dniNoValido = false
                
                digitosValidado = Int(numerosNIE)!
                dniLetra = letra[digitosValidado % 23]
                resultadoDNI = "\(String(digitosNIE))\(dniLetra)"
                
            } else {
                
                dniNoValido = true
                
            }
            
        } else if Int(digitos) == nil || Int(digitos)! < 1_000_000 || Int(digitos)! > 99_999_999 {
            
            dniNoValido = true
            
            
        } else if Int(digitos)! > 1_000_000 && Int(digitos)! < 99_999_999 {
            dniNoValido = false
            digitosValidado = Int(digitos)!
            dniLetra = letra[digitosValidado % 23]
            
            resultadoDNI = "\(String(digitosValidado))\(dniLetra)"
            
        }
        
        
        return resultadoDNI
        
    }
    
}





