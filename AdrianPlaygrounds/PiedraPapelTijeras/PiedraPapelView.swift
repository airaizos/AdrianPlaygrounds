//
//  PiedraPapelView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 25/7/21.
//

import SwiftUI

struct PiedraPapelView: View {
    var body: some View {
        VStack{
        Text("phone")
        Text("✊🏼")
            .font(.system(size: 60))
            .padding(.bottom, 50)
            Text("human")
        Text("✊🏼✋🏼✌🏼 🦎🖖🏽")
            .font(.system(size: 50))
        }
    }
}

// commit

struct PiedraPapelView_Previews: PreviewProvider {
    static var previews: some View {
        PiedraPapelView()
    }
}
