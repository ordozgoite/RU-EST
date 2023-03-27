//
//  ScanViewModel.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import Foundation

@MainActor
class ScanViewModel: ObservableObject {
    
    @Published var scannedCode: String? {
        didSet {
            Task {
                await getCodeInfo()
            }
        }
    }
    @Published var isLoading: Bool = false
    @Published var goToNext: Bool = false
    @Published var customer: Customer?
    
    func getCodeInfo() async {
        self.isLoading = true
        let response = await RUServices.shared.getCustomerByBarcode(barcode: scannedCode ?? "")
        self.isLoading = false
        
        print("⚠️ Customer: \(response)")
        
        switch response {
        case .success(let customer):
            self.customer = customer
            self.goToNext = true
        case .failure:
            print("An unknown error is an error that is not known.")
        }
    }
}
