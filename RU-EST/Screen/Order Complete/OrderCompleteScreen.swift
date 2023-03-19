//
//  OrderCompleteScreen.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import SwiftUI

struct OrderCompleteScreen: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 64) {
                Image("checkmark")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Pedido Concluído!")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Button {
                //
            } label: {
                ZStack {
                    Rectangle()
                        .fill(Color.primaryColor)
                        .frame(width: 320, height: 64)
                    
                    Text("Finalizar")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct OrderCompleteScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompleteScreen()
    }
}
