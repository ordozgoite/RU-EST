//
//  RUServices.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 26/03/23.
//

import Foundation

protocol HWServiceable {
    
    // Customers
    func getCustomerByBarcode(barcode: String) async -> Result<Customer, RequestError>
}

struct RUServices: HTTPClient, HWServiceable {
    
    static let shared = RUServices()
    private init() {}
    
    //MARK: - Customers
    
    func getCustomerByBarcode(barcode: String) async -> Result<Customer, RequestError> {
        return await sendRequest(endpoint: RUEndpoints.getCustomerByBarcode(barcode: barcode), responseModel: Customer.self)
    }
}
