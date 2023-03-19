//
//  ConfirmOrderScreen.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import SwiftUI

struct ConfirmOrderScreen: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("John Doe")
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                Text("Almoço")
                Text("-")
                Text("R$0,80")
            }
            .font(.title2)
            .fontWeight(.light)
            
            Spacer()
            
            Button {
                //
            } label: {
                ZStack {
                    Rectangle()
                        .fill(Color.primaryColor)
                        .frame(width: 320, height: 64)
                    
                    Text("Confirmar Pedido")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
        }
        .navigationTitle("Pedido")
    }
}

struct ConfirmOrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmOrderScreen()
    }
}
