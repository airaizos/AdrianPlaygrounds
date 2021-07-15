//
//  DNIInfoView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 15/7/21.
//

import SwiftUI

struct DNIInfoView: View {

    
    var body: some View {
        VStack{
            
                
            Button(action: {
                
                showInfo.toggle()
                
            })
                   
                   {
                ZStack{
                    Circle()
                        
                        .frame(width: 50, height: 50, alignment: .center)
                Image(systemName: "arrow.uturn.backward.circle.fill")
                    .font(.system(size: 40))
                    .clipped()
                    .foregroundColor(.yellow)
                }
            }
            
        Text("Introduce un DNI o NIE válido. \nDNI: Consta de 7 digitos\nNIE: Consta de una letra (X,Y o Z) y 7 digitos\nLa letra de control se calculará con esos datos.")
            .multilineTextAlignment(.leading)
            .padding()
        }
    }
}

struct DNIInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DNIInfoView()
    }
}
