//
//  Endpoint.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 26/03/23.
//

import Foundation

public typealias route = URLRequest

protocol Endpoint {
    var baseUrl: URL { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var query: [String: Any]? { get }
    var body: [String: Any]? { get }
}

extension Endpoint {
    
    var baseUrl: URL {
        return URL(string: "https://drab-cyan-marlin-kit.cyclic.app")!
//        return URL(string: "http://localhost:3000")!
    }
}

public enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case dataNotFound
    case incorrectOTP
    case unexpectedStatusCode
    case forbidden
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        case .unexpectedStatusCode:
            return "Something went wrong, please try again later"
        case .dataNotFound:
            return "Data not found"
        case .incorrectOTP:
            return "You entered incorrect OTP"
        default:
            return "Unknown error"
        }
    }
}

//TODO: implement the Endpoint as struct in future and separate out the params, request

//struct APIEndpoint<Body: Codable>: Convertible {
//    var method: RequestMethod
//    var url: URL
//    var path: String
//    var pathVariables: [String]?
//    var query: [String: String]?
//    var requestType: RequestType
//    var body: Body?
//    var headers: [String: String]
//
//    init(_ method: RequestMethod, _ url: URL, _ path: String, pathVariables: [String]? = nil,
//         query: [String: String]? = nil, requestType: RequestType = .json, body: Body? = nil,
//         headers: [String: String] = [:]) {
//        self.method = method
//        self.url = url
//        self.path = path
//        self.pathVariables = pathVariables
//        self.query = query
//        self.requestType = requestType
//        self.body = body
//        self.headers = headers
//    }
//}
