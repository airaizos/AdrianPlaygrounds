////
////  GastaFortunasView.swift
////  AdrianPlaygrounds
////
////  Created by Adrian Iraizos Mendoza on 2/8/21.
////
//
//import SwiftUI
//
//struct GastaFortunasView: View {
//    @StateObject var catalogo = Catalogo()
//    @StateObject var fortuna =  GastaFortunas()
//    @State private var mostrarFactura = false
//    
//   // @State private var ricoElegido = "Jeff Bezos"
//    //@State private var mostrarFactura = false
//    
//    var fortunaElegida:Int { fortuna.ricos[fortuna.ricoElegido] ?? 0 }
//    var remanente:Double { Double(fortuna.fortunaElegida) - fortuna.gastado }
//    var filtro: Articulo.categoria
//    
//    
////    let ricos:  [String:Int] = [
////        "Jeff Bezos":116_200_000_000,
////        "Amancio Ortega":76_600_000_000,
////        "Carlos Slim":61_500_000_000,
////        "Jack Ma":47_100_000_000,
////        "Françoise Bettancourt":59_300_000_000]
//    
//    var fotoRico: Image {
//        switch fortuna.ricoElegido {
//        case"Jeff Bezos": return Image("JeffBezos")
//        case "Amancio Ortega" :  return Image("AmancioOrtega")
//        case "Carlos Slim" : return Image("CarlosSlim")
//        case "Jack Ma" : return Image("JackMa")
//        case "Françoise Bettancourt": return Image("FBettancourt")
//        default : return Image("JeffBezos")
//        }
//    }
//    
//    var categoriasFiltradas: [Articulo] {
//        switch filtro {
//        case .Inmuebles: return catalogo.articulosJson.filter {$0.categoria.contains("Inmuebles")}
//        case .Transporte: return catalogo.articulosJson.filter {$0.categoria.contains("Transporte")}
//        case .Personal: return catalogo.articulosJson.filter {$0.categoria.contains("Personal")}
//        case .Equipos: return catalogo.articulosJson.filter {$0.categoria.contains("Equipos")}
//        case .Tecnología: return catalogo.articulosJson.filter {$0.categoria.contains("Tecnología")}
//        case .Arte: return catalogo.articulosJson.filter {$0.categoria.contains("Arte")}
//        }
//    }
//    var body: some View {
//        VStack{
//            //MARK: TITULO
//            Section{
//                Text("\(fortuna.ricoElegido)")
//                    .foregroundColor(cPrecio)
//                    .font(.headline)
//                fotoView(image: fotoRico)
//                Text("\(fortunaElegida)€")
//                    .font(.headline)
//
//            }.padding(1)
//            ScrollView {
//                Section{
//                    
//                    //MARK: TODO: Mejor un ForEach
//                    VStack {
//                        Text("Inmuebles")
//                        HStack {
//                            CategoriasView(filtro: .Inmuebles)
//                        }
//                    }
//                    VStack{
//                        Text("Personal")
//                        HStack{
//                            CategoriasView(filtro: .Personal)
//                        }
//                    }
//                    VStack{
//                        Text("Transporte")
//                        HStack {
//                            CategoriasView(filtro: .Transporte)
//                        }
//                    }
//                    VStack{
//                        Text("Tecnología")
//                        HStack {
//                            CategoriasView(filtro: .Tecnología)
//                        }
//                    }
//                    VStack{
//                        Text("Arte")
//                        HStack {
//                            CategoriasView(filtro: .Arte)
//                        }
//                    }
//                    VStack{
//                        Text("Equipos")
//                        HStack{
//                            CategoriasView(filtro: .Equipos)
//                        }
//                    }
//                }.foregroundColor(cNombre)
//                .font(.title3)
//                
//            }
//            //MARK: TOTALES
//            VStack(alignment: .trailing){
//                
//                Text("Articulos: \(fortuna.cantidad)")
//                    .foregroundColor(cStroke)
//                Text("Gastado \(fortuna.gastado,specifier: "%.0f")")
//                    .foregroundColor(cNombre)
//                Text("Remanente:  \((Double(fortunaElegida) - fortuna.gastado),specifier: "%.0f")")
//            }.font(.headline)
//            
//            Button(action: {
//                mostrarFactura.toggle()
//                
//            }){
//                Text("Pagar")
//                    .frame(maxWidth:.infinity, alignment: .center)
//            }.sheet(isPresented: $mostrarFactura, content: { InvoiceView()
//            
//        })
//            
//        }.padding(20)
//        
//        .navigationTitle("Gasta la fortuna de").font(.headline)
//        .toolbar{
//            ToolbarItem{
//                Menu("Elige fortuna") {
//                    ForEach(fortuna.ricos.sorted(by: <), id:\.key){ key, value in
//                        
//                        Button(action: {
//                            fortuna.ricoElegido  = key
//                        },label: { Text(key)
//                        })
//                        
//                    }
//                }
//            }
//        }
//    }
//}
//
//
///*
// ¿Un picker?
//            Picker(selection: $ricoElegido, label: Text("Picker")) {
//                ForEach(ricos.sorted(by: <), id:\.key){ key, value in
//                    Text(key)
//            }
//
//            }
//*/
