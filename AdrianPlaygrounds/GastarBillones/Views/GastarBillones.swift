//
//  GastarBillones.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 19/9/21.
//

import SwiftUI

struct GastarBillones: View {
    @EnvironmentObject var modeloArticulos: ModeloArticulos
    var articulo: Articulo
    @StateObject private var fortuna = GastaFortunas()
   
    let gridItem = GridItem(.fixed(100))
    @State private var indiceRico = 0
    
    let listaCategorias = ["Inmuebles", "Personal", "Tecnología", "Equipos","Transporte","Arte"]
    
  //  let filtro: Articulo.categoria
//    var categoriasFiltradas: [Articulo] {
//        
//        switch filtro {
//        case .Inmuebles: return modeloArticulos.articulos.filter {$0.categoria.contains("Inmuebles")}
//        case .Transporte: return modeloArticulos.articulos.filter {$0.categoria.contains("Transporte")}
//        case .Personal: return modeloArticulos.articulos.filter {$0.categoria.contains("Personal")}
//        case .Equipos: return modeloArticulos.articulos.filter {$0.categoria.contains("Equipos")}
//        case .Tecnología: return modeloArticulos.articulos.filter {$0.categoria.contains("Tecnología")}
//        case .Arte: return modeloArticulos.articulos.filter {$0.categoria.contains("Arte")}
//        case .Todos: return
//            modeloArticulos.articulos
//        }
//    }
    
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
        NavigationView {
        VStack {
            Section {
                Button(action: {
                    fortuna.ricoElegido = Array(fortuna.ricos.keys)[indiceRico]
                    fortuna.fortunaElegida = Array(fortuna.ricos.values)[indiceRico]
                    if indiceRico == Array(fortuna.ricos.keys).count - 1 {
                        indiceRico = 0
                    } else {
                        indiceRico += 1
                    }
                }, label: {
                    Image(fortuna.ricoElegido)
                        .frame(height: 150)
                        .clipShape(Circle())
                        
                        .overlay(Circle().stroke(Color.black,lineWidth: 2))
                        .shadow(radius: 10)
                })
            }
            Text("\(fortuna.ricoElegido)")
            Text("\(fortuna.fortunaElegida)")
            List {
                ForEach(listaCategorias, id:\.self) {
                    
               Text($0)
           
                    }
                    //mandar a la vista articuloView pasando el filtro de la categoria
                
                
                //o hacer un horizontal grid con todos y fiesta.
                }
                    
                    
//                   } ForEach(listado.categorias, id:\.self) {
//                        cat in
//                        Text(cat)
//                ForEach(listado.categorias, id:\.self) {
//                    cat in
//                    NavigationLink( destination: CategoriasView(catalogo: _modeloArticulos, filtro: filtro)) {
//                        articuloView(articulo: articulo)
//                    }
//                    }
//                ForEach(modeloArticulos.articulos, id:\.self) { categoria in
//                    NavigationLink(destination: Categorias2View(articulo: articulo)) {
//                       
//                        Text(articulo.categoria)
//                        
//                    }
//                }
            
           Image(systemName: "lasso")
            Image(systemName: "lasso")
            Image(systemName: "lasso")
            Image(systemName: "lasso")
            Image(systemName: "lasso")
            Text(String(fortuna.remanente))
//            Form {
//            Button( action: {
//                fortuna.gastado = articulo.precio
//            } , label: {
//                ZStack {
//                    Text("\(remanente)")
//                        .foregroundColor(.black)
//                }
//            })
//        }
        }
        .navigationBarTitle("Gasta la fortuna de...",displayMode: .inline)
        
        
    }
    }

    
    
    //    .toolbar {
    //    ToolbarItem {
    //    Menu("Elige tu fortuna") {
    //    ForEach(0 ..< 5) {
    //    i in
    //    Button(action: {
    //    //action
    //    }, label: {
    //    Text("\(i)")
    //    })
    //
    //    ForEach(fortuna.ricos.sorted(by: <), id:\.key) {
    //    key, value in
    //
    //    Button(action: {
    //    fortuna.ricoElegido = key
    //    }, label: { Text(key)
    //    })
    //    }
    //    }
    //    }
    //    }
    //    }

}
struct GastarBillones_Previews: PreviewProvider {
    static let modeloArticulos = ModeloArticulos()
 
    
    static var previews: some View {
        GastarBillones(articulo: modeloArticulos.articulos[0])
            .environmentObject(modeloArticulos)
    }
}

