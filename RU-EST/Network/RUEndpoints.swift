//
//  RUEndpoints.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 26/03/23.
//

import Foundation

enum RUEndpoints {
    case getCustomerByBarcode(barcode: String)
}

extension RUEndpoints: Endpoint {
    
    var path: String {
        switch self{
        case .getCustomerByBarcode(let barcode):
            return "/api/Customers/GetCustomerByBarcode/\(barcode)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getCustomerByBarcode:
            return .get
        }
    }
    
    var query: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var header: [String : String]? {
        switch self {
        default:
            return [
                "Accept": "application/x-www-form-urlencoded",
                "Content-Type": "application/json"
            ]
        }
    }
    
    
    var body: [String : Any]? {
        switch self {
        case .getCustomerByBarcode:
            return nil
        }
    }
}
