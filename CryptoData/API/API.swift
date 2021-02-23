//
//  API.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 20/02/2021.
//

import Foundation

class API {
    
    static let ROOT_URL = "https://min-api.cryptocompare.com"
    static let API_KEY = "a6f5317f114a3693b7ee4c59e4e9e1737e7b74c742b203b5bf0befacc8f60c1a"
    
    enum HTTPMethod: String {
        case get
    }
    
    typealias HTTPHeaders = [String: String]
    static var headers: HTTPHeaders = [
        HTTPHeaderField.contentType: ContentType.json
    ]

    struct HTTPHeaderField {
        static let authorization = "Authorization"
        static let contentType = "Content-Type"
    }

    struct ContentType {
        static let json = "application/json"
    }
}

