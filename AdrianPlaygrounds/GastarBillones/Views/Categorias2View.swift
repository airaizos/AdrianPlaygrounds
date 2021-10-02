//
//  Categorias2View.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 22/9/21.
//

import SwiftUI

struct Categorias2View: View {
    @EnvironmentObject var modeloArticulos: ModeloArticulos
    var articulo: Articulo
    var filtro = ""
    var categoriasFiltradas: [Articulo] {
        
        
        switch filtro {
        case "Inmuebles": return modeloArticulos.articulos.filter {$0.categoria.contains("Inmuebles")}
        case "Transporte": return modeloArticulos.articulos.filter {$0.categoria.contains("Transporte")}
        case "Personal": return modeloArticulos.articulos.filter {$0.categoria.contains("Personal")}
        case "Equipos": return modeloArticulos.articulos.filter {$0.categoria.contains("Equipos")}
        case "Tecnología": return modeloArticulos.articulos.filter {$0.categoria.contains("Tecnología")}
        case "Arte": return modeloArticulos.articulos.filter {$0.categoria.contains("Arte")}
        default: return
            modeloArticulos.articulos
        }
    }

    var body: some View {
        
        List {
            VStack {
                
                ForEach(modeloArticulos.articulos, id:\.categoria) { cat in NavigationLink(destination: articuloView(articulo: articulo, categoria: .init(categoria: "Inmuebles"))) {
                    
                    Text(articulo.categoria)
                }
                
                }
                
            }
        }
    }
}

struct Categorias2View_Previews: PreviewProvider {
    static var articulos = ModeloArticulos().articulos
    
    static var previews: some View {
        Group {
            Categorias2View(articulo: articulos[0])
            Categorias2View(articulo: articulos[6])
        }
    }
}
