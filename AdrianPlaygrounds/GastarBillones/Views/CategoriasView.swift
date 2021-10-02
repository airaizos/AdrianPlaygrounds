////
////  CategoriasView.swift
////  AdrianPlaygrounds
////
////  Created by Adrian Iraizos Mendoza on 4/8/21.
////
//
//import SwiftUI
//
//struct CategoriasView: View {
//    var catalogo: ModeloArticulos
//    
//    var body: some View {
//        ScrollView{
//            ScrollView(.horizontal){
//                HStack{
//                    ForEach(categoriasFiltradas) { articulo in
//                        
//                        articuloView(articulo: articulo)
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct CategoriasView_Previews: PreviewProvider {
//    static let modeloArticulos = ModeloArticulos()
//    
//    static var previews: some View {
//        CategoriasView(catalogo: modeloArticulos, filtro: .Arte)
//            .environmentObject(modeloArticulos)
//    }
//}
