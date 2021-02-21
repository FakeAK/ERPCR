//
//  CryptoCompareAPIResponse.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 20/02/2021.
//

import Foundation

final class CryptoCompareAPIResponse: Decodable {
    let Data: [Coin]
}
