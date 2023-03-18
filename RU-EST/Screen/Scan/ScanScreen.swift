//
//  ScanScreen.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 17/03/23.
//

import SwiftUI

struct ScanScreen: View {
    
    @State private var scannedCode: String?
    
    var body: some View {
        ZStack {
            BarcodeScannerView(scannedCode: $scannedCode)
            
            VStack {
                if let scannedCode = scannedCode {
                    ProgressView()
                } else {
                    ScanOverlay()
                }
            }
        }
    }
}
