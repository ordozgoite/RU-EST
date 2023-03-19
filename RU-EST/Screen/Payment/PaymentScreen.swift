//
//  PaymentScreen.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import SwiftUI

struct PaymentScreen: View {
    var body: some View {
        VStack(spacing: 64) {
            Text("Realize o pagamento")
                .font(.title)
                .fontWeight(.bold)
            
            Image("qr-code")
                .resizable()
                .frame(width: screenWidth - 32, height: screenWidth - 32)
            
            VStack {
                Text("Esse QR Code expirará em")
                    .fontWeight(.light)
                
                Text("04:59")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct PaymentScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaymentScreen()
    }
}
