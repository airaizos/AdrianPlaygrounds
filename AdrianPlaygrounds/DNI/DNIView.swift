//
//  DNIView.swift
//  AdrianPlaygrounds
//
//  Created by Adrian Iraizos Mendoza on 14/7/21.
//

import SwiftUI

struct DNIView: View {
   
    @ObservedObject var dni = Dni()
    //73057974
    var suma = 0
   
    var dniValido = 0
    var dniCalculado = 0
 @State private var numerosDNI = ""
    
    var body: some View {
        VStack{
        
        Text("Calcula la letra de tu DNI")
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            
            Toggle("Es NIE?", isOn: $dni.esNIE)
            
            TextField("Introduce los dígitos de tu DNI", text: $numerosDNI)
                .keyboardType(.numberPad)
           
            
            Button(action: {
                dni.resultadoDNI = dni.validaDNI(digitos: numerosDNI)
                
            })
                   {
                Text("\nQuiero saber la letra")
                   }.alert(isPresented: $dni.dniNoValido, content: {
                    Alert(title: Text("Digitos no validos"), message: Text("Intentalo de nuevo"), dismissButton: .default(Text("¡Enterado!")))
                   
                   })
            if dni.esNIE {
                Text("\(dni.resultadoDNI)")
                    .foregroundColor(dni.resultadoDNI == "0" ? .white : .green)
                    .font(.system(size: 50))
                    .padding(.vertical, 50)
            } else {
            Text("\(dni.resultadoDNI)")
            
                .foregroundColor(dni.resultadoDNI == "0" ? .white : .green)
                .font(.system(size: 50))
                .padding(.vertical, 50)
            }
                
        Spacer()
        Text("Introduce los dígitos de tu DNI y sabrás la letra")
            .font(.subheadline)
        } .padding()
    }
}

struct DNIView_Previews: PreviewProvider {
    static var previews: some View {
        DNIView()
    }
}
