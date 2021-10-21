//
//  ObservaLasFigurasViewModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 5/10/21.
//

import Foundation
import SwiftUI

struct Figura {
    var numero: Int
    var geometrica: String
    var color: Color
}

struct vistaFigura: ViewModifier {
    var figura: Figura
    func body(content: Content) -> some View {
        content
        ZStack(alignment: .center) {
            Image(systemName: "\(String(describing: figura.geometrica))").font(.system(size: 30, weight: .semibold)).foregroundColor(figura.color)
                .offset(x:1, y:-1)
            Text("\(figura.numero)")
                .foregroundColor(.black)
        }
    }
}

class adivinaFiguras : ObservableObject {
    
  //  @Published var figuras = [Figura](arrayLiteral: Figura.init(numero: numAleatorio, geometrica: geoAleatorio, color: colorAleatorio),Figura.init(numero: numAleatorio, geometrica: geoAleatorio, color: colorAleatorio))
    
    @Published var figuras = [Figura]()
    
    @Published var racha = 0
    
    var geometricas = ["triangle","circle","square"]
    var colores = [Color.red, Color.blue, Color.green]
    
    func agregaFiguras() {
        for _ in 1...(racha < 2 ? 1 : racha < 7 ? racha : 6) {
            figuras.append(Figura.init(numero: numAleatorio, geometrica: geoAleatorio, color: colorAleatorio))
        }
    }
    
}
var numAleatorio:Int {
    Int.random(in: 1...9)
}

var geoAleatorio:String {
    let geometrica = ["triangle","circle","square"]
    return geometrica[Int.random(in: 0...2)]
}
var colorAleatorio: Color {
    let colores:[Color] = [.red, .blue, .yellow]
    return colores[Int.random(in: 0...2)]
    
}

