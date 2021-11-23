//
//  SumaRestaMultiplicaView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 2/10/21.
//

import SwiftUI

struct SumaRestaMultiplicaView: View {
    @ObservedObject var operaciones = Operaciones()
    
    //  MARK: Alertas  y Validaciones
    //  No puede usarse el 1 ni el 0, sería demasiado fácil
    
    @State private var errorTitulo = ""
    @State private var errorMensaje = ""
    @State private var mostrarError = false
    
    //  Animaciones
    @State private var animacionIntento = 0.0
    
    @State private var intentoErroneo = false
    
    //  MARK: ToDo ->  Formato, puntos
    
    var body: some View {
        NavigationView {
            VStack {
                
                Button(action: {
                    operaciones.nuevoJuego()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 200, height: 40)
                            .foregroundColor(color4)
                        Text("Iniciar")
                            .foregroundColor(.white)
                        
                    }
                    .padding(.top, 10)
                })
                
                
                Text("\(operaciones.resultado)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(color3)
                    .rotation3DEffect(
                        .degrees(animacionIntento),
                        axis: (x:0, y:1, z:0)
                    )
                
                
                HStack(alignment: .center) {
                    TextField("num1", text: $operaciones.string1)
                        .frame(width: 50, height: 50, alignment: .center)
                        
                        .keyboardType(.numberPad)
                    
                    
                    Text(operaciones.operador0)
                    
                    
                    TextField("num1", text: $operaciones.string2)
                        
                        .keyboardType(.numberPad)
                    
                    Text(operaciones.operador1)
                    
                    
                    TextField("num1", text: $operaciones.string3)
                        
                        .keyboardType(.numberPad)
                    
                    Text(operaciones.operador2)
                    
                    
                    TextField("num1", text: $operaciones.string4)
                        
                        .keyboardType(.numberPad)
                    
                }
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(color3)
                .padding()
                
                
                Button(action: {
                    withAnimation {
                        animacionIntento += 360
                    }
                    operaciones.calcular()
                    validar()
                    print("principal\(mostrarError)")
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 300, height: 50)
                            .foregroundColor(color1)
                        Text("Voy a tener suerte")
                            .font(.largeTitle.italic())
                            .foregroundColor(color4)
                        
                    }
                })
                
                VStack {
                    Image(systemName: "equal")
                        .padding()
                    
                    
                    Text("\(operaciones.intento)")
                        .rotation3DEffect(
                            .degrees(animacionIntento),
                            axis: (x:0, y:1, z:0)
                        )
                    
                }
                .font(.largeTitle.bold())
                .foregroundColor(operaciones.intentoErroneo == false ? color3 : .red)
                
                
                
                Spacer()
                Group{
                Text("Puntos: \(operaciones.puntos)")
                    Text("Racha: \(operaciones.racha)")
                }
                .foregroundColor(color1)
                .font(.largeTitle)
                
                Spacer()
                
                Text("Encuentra el número utilizando todos los operadores").multilineTextAlignment(.center)

            }
            .navigationBarTitle("Suma Resta Multiplica",displayMode: .inline)
            .alert(isPresented: $mostrarError) {
                Alert(title: Text(errorTitulo), message: Text(errorMensaje), dismissButton: .default(Text("Entendido")))
            }
        }
        
    }
    // Validación Alert
    func validar() {
        
        func errorNumeros(titulo: String, mensaje: String) {
            errorTitulo = titulo
            errorMensaje = mensaje
            mostrarError = true
        }
        
        func haUsadoElUno(numeros: Int...) -> Bool {
            return (!numeros.contains(1) && !numeros.contains(0))
        }
        
        guard haUsadoElUno(numeros: operaciones.numero1,operaciones.numero2,operaciones.numero3,operaciones.numero4) else {
            errorNumeros(titulo: "🚫 0️⃣,1️⃣ ", mensaje: "No puedes usar ni el 0 ni el 1")
            print("guard error\(errorTitulo)")
            return
        }
        print("Error: \(errorTitulo)")
        
    }
    
}

struct SumaRestaMultiplicaView_Previews: PreviewProvider {
    static var previews: some View {
        SumaRestaMultiplicaView()
    }
}



/// realiza operación del numero de la izquierda y de la derecha
//func opera(numIzq: Int, numDer: Int, operador: String) -> Int {
//    var resultado = 0
//
//    switch operador {
//    case "+": resultado = numIzq + numDer
//    case "-": resultado = numIzq - numDer
//    default: resultado = numIzq * numDer
//    }
//    return resultado
//}



