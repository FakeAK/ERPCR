//
//  API+Reques.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 20/02/2021.
//

import Foundation
import Combine

extension API {
    
    static func request<T: Decodable>(_ url: URL,
                                      method: HTTPMethod,
                                      parameters: [String: Any]? = nil,
                                      _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<APIResponse<T>, Error> {
        var request: URLRequest = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = method.rawValue
        request.setValue(ContentType.json, forHTTPHeaderField: HTTPHeaderField.contentType)
        request.setValue("Apikey \(API.API_KEY)", forHTTPHeaderField: HTTPHeaderField.authorization)
        
        if let parameters = parameters, let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
            request.httpBody = httpBody
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap { (data, response) -> APIResponse<T> in
                let decodedData = try decoder.decode(T.self, from: data)
                return APIResponse(value: decodedData, response: response)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
