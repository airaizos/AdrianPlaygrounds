//
//  GastarFortunasModel.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 2/8/21.
//

import Foundation
import Combine

final class ModeloArticulos: ObservableObject {
    @Published var articulos: [Articulo] = cargar("Catalogo.json")
}

final class ModeloFortunas: ObservableObject {
    @Published var fortunas: [Fortuna] = cargar("Fortuna.json")
}

    func cargar<T: Decodable>(_ nombreArchivo: String) -> T {
        let json: Data
        
        guard let archivo = Bundle.main.url(forResource: nombreArchivo, withExtension: nil) else {
            fatalError("No se ha podido ENCONTRAR el \(nombreArchivo)")
        }
        do {
            json = try Data(contentsOf: archivo)
            
        } catch {
            fatalError("No se ha podido CARGAR el archivo \(nombreArchivo)")
        }
        do {
            let decodificador = JSONDecoder()
            return try decodificador.decode(T.self, from: json)
        } catch {
            fatalError("No se ha podido ANALIZAR el archivo \(nombreArchivo)")
        }
        
    }



