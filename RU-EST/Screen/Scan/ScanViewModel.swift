//
//  ScanViewModel.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import Foundation

class ScanViewModel: ObservableObject {
    
    @Published var scannedCode: String? {
        didSet {
            getCodeInfo()
        }
    }
    @Published var isLoading: Bool = false
    
    func getCodeInfo() {
        self.isLoading = true
    }
}
