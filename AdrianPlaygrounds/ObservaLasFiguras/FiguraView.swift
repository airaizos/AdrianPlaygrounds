//
//  FiguraView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 6/10/21.
//

import SwiftUI

struct FiguraView: View {
    
    var figura: Figura
    var rachaGeometrica: Bool
    var rachaColor: Bool
    var racha: Int
 
    var body: some View {
        ZStack{
            Text("\(figura.numero)")
                .offset(x:0, y: racha < 7 ? 0 : figura.geometrica == "triangle" ? 8 : 0)
                .font(.system(size: 50))
            Image(systemName: "\(figura.geometrica)")
                
                .foregroundColor(rachaColor ? figura.color : rachaGeometrica ? .black : .clear)
        }
        .font(.system(size: 80))
    }
}

struct FiguraView_Previews: PreviewProvider {
    static var previews: some View {
        FiguraView(figura: .init(numero: 5, geometrica: "triangle", color: .blue),rachaGeometrica: true, rachaColor: true, racha: 1)
    }
}
