//
//  SwiftUIView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 23/11/21.
//

import SwiftUI

struct CardView: View {
    let radio:CGFloat = 5
    let contorno:CGFloat = 2
    let ancho:CGFloat = 77
    let largo:CGFloat = 120
    let carta: String
    
    
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: radio)
                .stroke(Color.black,lineWidth: contorno)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
            .frame(width: ancho, height: largo)
            
            Text("\(carta)")
                .font(.largeTitle)
                .shadow(color: .gray, radius: 1, x: 1, y: 1)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(carta: "2♥️")
    }
}
