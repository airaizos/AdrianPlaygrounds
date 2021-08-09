//
//  fotoView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 8/8/21.
//

import SwiftUI

struct fotoView: View {
    var image: Image
    var body: some View {
       
        image
           
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(red: 0.522, green: 0.576, blue: 0.478, opacity: 1.000), lineWidth: 4))
                        .shadow(radius: 7)
            .fixedSize()
    }
}

struct fotoView_Previews: PreviewProvider {
    static var previews: some View {
        fotoView(image: Image("FBettancourt"))
    }
}
