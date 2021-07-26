//
//  PiedraPapelCircle.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 25/7/21.
//

import SwiftUI

struct PiedraPapelCircle: View {
    var pieza = "🦎"
    var color = Color(red: 1, green: 0.968, blue: 0.251, opacity: 1)
  
    var axis:[CGFloat] = [0,1,0]
    
    var escalaAnimacion:[Double] = [0,0,0,0,0]
   var idCarta = 0
    
    var body: some View {
        ZStack{
        Circle()
            .shadow(radius: 10)
            .foregroundColor(color)
            Circle()
                .stroke()
                .scale(0.80)
                .foregroundColor(.white)
            Circle()
                .scale(0.80)
                .foregroundColor(.white .opacity(0.7))
            HStack{
            Text("\(pieza)")
                .font(.system(size: 100))
                .shadow(radius: 10)
            }          .rotation3DEffect(.degrees(escalaAnimacion[idCarta]), axis: (x: axis[0], y: axis[1], z: axis[2]))
        }
    }
}



struct PiedraPapelCircle_Previews: PreviewProvider {
    static var previews: some View {
        PiedraPapelCircle()
    }
}
