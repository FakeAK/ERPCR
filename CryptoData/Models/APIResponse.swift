//
//  APIResponse.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 20/02/2021.
//

import Foundation

struct APIResponse<T> {
    let value: T
    let response: URLResponse
}
