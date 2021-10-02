//
//  articuloView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 2/8/21.
//

import SwiftUI

struct articuloView: View {
    @EnvironmentObject var fortuna : GastaFortunas
    @EnvironmentObject var modeloArticulos : ModeloArticulos

    
    var articulo: Articulo
    var gastado: Double = 0
    var cantidad: Int = 0
//    var articuloIndex: Int {
//        modeloArticulos.articulos.firstIndex(where: { $0.id == articulo.id })!
//    }
    var categoria: Categoria
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
        Button(action: {
            fortuna.gastado += articulo.precio
            fortuna.cantidad += 1
            fortuna.items.append(articulo.nombre)
            
        } , label: {
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color3)
                    .frame(width: 220, height: 240, alignment: .center)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(color4)
                    .frame(width: 200, height: 140, alignment: .center)
                Image(articulo.foto)  .resizable()
                    .frame(minWidth: 190, idealWidth: 190, maxWidth: 190, minHeight: 130, idealHeight: 130, maxHeight: 130, alignment: .center)
                    .cornerRadius(20)
                    .padding(20)
                    .shadow(radius: 20)
                HStack{
                    Text(articulo.nombre)
                        .padding(.top, -110)
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(color1)
                }.frame(width: 220, height: 40, alignment: .center)
                Text("\(articulo.precio,specifier: "%.2f") €")
                    .padding(.top, 180)
                    .font(.system(size: 20,weight: .semibold))
                    .foregroundColor(color2)
                
                //MARK: TODO: Cambiar los magicNumbers 
            }
        })
    }
}

struct articuloView_Previews: PreviewProvider {
    static let modeloArticulos = ModeloArticulos()

    static var previews: some View {
        articuloView(articulo: modeloArticulos.articulos[0], categoria: .init(categoria: "Inmuebles"))
            .environmentObject(modeloArticulos)
    }
}

