//
//  CuadradoGrid.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 21/10/21.
//

import Foundation
import SwiftUI


class Cuadrado: ObservableObject {
    @Published var casillas: [String] = []
    @Published var box1 = ""
    @Published var box2 = ""
    @Published var box3 = ""
    @Published var box4 = ""
    @Published var box5 = ""
    @Published var box6 = ""
    @Published var box7 = ""
    @Published var box8 = ""
    @Published var box9 = ""
    @Published var total1 = 0
    @Published var total2 = 0
    @Published var total3 = 0
    @Published var total4 = 0
    @Published var total5 = 0
    @Published var total6 = 0
    @Published var total7 = 0
    @Published var total8 = 0
  
    func num(box: String) -> Int {
        let num = Int(box) != nil ? Int(box)! : 0
        return num
    }
    
    func subtotal(boxA: Int, boxB: Int, boxC: Int) -> Int {
        boxA + boxB + boxC
    
}
    
    

    
    init() {
        self.total1 = subtotal(boxA: num(box: box1), boxB: num(box: box2), boxC: num(box: box3))
        self.total2 = subtotal(boxA: num(box: box4), boxB: num(box: box5), boxC: num(box: box6))
        self.total3 = subtotal(boxA: num(box: box7), boxB: num(box: box8), boxC: num(box: box9))
        self.total5 = subtotal(boxA: num(box: box3), boxB: num(box: box6), boxC: num(box: box9))
        self.total6 = subtotal(boxA: num(box: box2), boxB: num(box: box5), boxC: num(box: box8))
        self.total7 = subtotal(boxA: num(box: box1), boxB: num(box: box4), boxC: num(box: box7))
        
    }
}

struct casilla: ViewModifier {
    
    var ancho: CGFloat
    var alto: CGFloat
    var repetido: Bool
    func body(content: Content) -> some View {
        content
        
            .font(.largeTitle)
            .foregroundColor(repetido ? .red : .black)
            .frame(width: ancho, height: alto, alignment: .center)
            .keyboardType(.numberPad)
    }
}

