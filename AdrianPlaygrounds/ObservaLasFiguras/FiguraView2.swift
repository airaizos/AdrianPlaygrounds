//
//  FiguraView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 6/10/21.
//

import SwiftUI

struct FiguraView2: View {
    
    var numero = 5
    var figura = "triangle"
    var color: Color = .red
    
    var figuraF: Figura = .init(numero: 9, geometrica: "square", color: .blue)
    
    var arrayF: [Figura] = [.init(numero: 5, geometrica: "square", color: .green),.init(numero: 2, geometrica: "triangle", color: .blue),.init(numero: 7, geometrica: "circle", color: .red)]
    
    var body: some View {
        VStack {
            HStack {
                ZStack{
                    Text("\(arrayF[0].numero)")
                        .offset(x:0, y: arrayF[0].geometrica == "triangle" ? 3 : 0)
                    Image(systemName: arrayF[0].geometrica)
                        .font(.largeTitle)
                        .foregroundColor(arrayF[0].color)
                }
                
                ZStack{
                    Text("\(arrayF[1].numero)")
                        .offset(x:0, y: arrayF[1].geometrica == "triangle" ? 3 : 0)
                    Image(systemName: arrayF[1].geometrica)
                        .font(.largeTitle)
                        .foregroundColor(arrayF[1].color)
                }
                ZStack{
                    Text("\(arrayF[2].numero)")
                        .offset(x:0, y: arrayF[2].geometrica == "triangle" ? 3 : 0)
                    Image(systemName: arrayF[2].geometrica)
                        .font(.largeTitle)
                        .foregroundColor(arrayF[2].color)
                }
            }
        }
    }
}

struct FiguraView2_Previews: PreviewProvider {
    static var previews: some View {
        FiguraView2(numero: 5, figura: "triangle", color: .red)
    }
}
