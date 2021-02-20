//
//  Currency.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 19/02/2021.
//

import Foundation

final class Currency: Decodable, Equatable {
    
    let name: String
    let shortName: String
    let price: Double
    
    init(name: String, shortName: String, price: Double) {
        self.name = name
        self.shortName = shortName
        self.price = price
    }
    
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.shortName == rhs.shortName
    }
}
