//
//  InvoiceView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 8/8/21.
//

import SwiftUI

struct InvoiceView: View {
    @EnvironmentObject var fortuna: GastaFortunas
    @EnvironmentObject var catalogo: Catalogo
    @State private var mostrarFactura = false
    
    
    var body: some View {
        VStack{
        Text("Lista de compra")
            .font(.title)
            .foregroundColor(cNombre)
            VStack.init(alignment: .leading) {
                            
                ForEach(fortuna.items.sorted(by: <), id:\.self) { item  in
                    HStack{
                            Spacer()
                            Text(item)
                            Spacer()
                    }.font(.subheadline)
                    .padding(.horizontal, 10)
                                
                }

            }
        }
        
    }
}
