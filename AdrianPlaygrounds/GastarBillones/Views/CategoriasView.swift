//
//  CategoriasView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 4/8/21.
//

import SwiftUI

struct CategoriasView: View {
    @EnvironmentObject var catalogo: Catalogo
    @EnvironmentObject var fortuna: GastaFortunas
    
    let filtro: Articulo.categoria
    
    var categoriasFiltradas: [Articulo] {
        switch filtro {
        case .Inmuebles: return catalogo.articulosJson.filter {$0.categoria.contains("Inmuebles")}
        case .Transporte: return catalogo.articulosJson.filter {$0.categoria.contains("Transporte")}
        case .Personal: return catalogo.articulosJson.filter {$0.categoria.contains("Personal")}
        case .Equipos: return catalogo.articulosJson.filter {$0.categoria.contains("Equipos")}
        case .Tecnología: return catalogo.articulosJson.filter {$0.categoria.contains("Tecnología")}
        case .Arte: return catalogo.articulosJson.filter {$0.categoria.contains("Arte")}
            
        }
    }
    
    var body: some View {
        ScrollView{
            ScrollView(.horizontal){
                HStack{
                    ForEach(categoriasFiltradas) { articulo in
                        
                        articuloView(articulo: articulo, categoria: filtro, fortuna: _fortuna)
                    }
                }
            }
        }
    }
}

