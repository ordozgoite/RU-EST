//
//  ScanOverlay.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import SwiftUI

struct ScanOverlay: View {
    var body: some View {
        VStack {
            Text("ESCANEIE O CÓDIGO DE BARRAS")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Spacer()
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.red)
            
            Spacer()
        }
        .padding([.top, .bottom], 16)
    }
}

struct ScanOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ScanOverlay()
    }
}
