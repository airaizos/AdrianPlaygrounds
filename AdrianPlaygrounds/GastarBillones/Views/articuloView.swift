//
//  articuloView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 2/8/21.
//

import SwiftUI

let cdfdcb9 = Color(red: 0.875, green: 0.863, blue: 0.725, opacity: 1.000)
let ca9af90 = Color(red: 0.663, green: 0.686, blue: 0.565, opacity: 1.000)
let c586c5c = Color(red: 0.345, green: 0.424, blue: 0.361, opacity: 1.000)
let c85937a = Color(red: 0.522, green: 0.576, blue: 0.478, opacity: 1.000)
let c202e32 = Color(red: 0.125, green: 0.180, blue: 0.196, opacity: 1.000)


let cNombre = c586c5c
let cPrecio = c202e32
let cBackground = cdfdcb9
let cStroke = c85937a

struct articuloView: View {
    @EnvironmentObject var fortuna : GastaFortunas
    
    var articulo: Articulo
    var categoria: Articulo.categoria
    var gastado:Double = 0
    var cantidad:Int = 0

    var body: some View {
        Button(action: {
            fortuna.gastado += articulo.precio
            fortuna.cantidad += 1
            fortuna.items.append(articulo.nombre)
            
        } , label: {
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(cBackground)
                    .frame(width: 220, height: 240, alignment: .center)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(cStroke)
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
                        .foregroundColor(cNombre)
                }.frame(width: 220, height: 40, alignment: .center)
                Text("\(articulo.precio,specifier: "%.2f") €")
                    .padding(.top, 180)
                    .font(.system(size: 20,weight: .semibold))
                    .foregroundColor(cPrecio)
                
                //MARK: TODO: Cambiar los magicNumbers 
            }
        })
    }
}


