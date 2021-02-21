//
//  Currency.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 19/02/2021.
//

import Foundation

final class EurCoinRawInfo: Decodable {
    let PRICE: Double
}

final class CoinRAW: Decodable {
    let EUR: EurCoinRawInfo
}

final class CoinInfo: Decodable {
    let Name: String
    let FullName: String
    let ImageUrl: String
}

final class Coin: Decodable, Equatable {
    
    let shortName: String
    let name: String
    let imageUrl: String
    let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case RAW
        case CoinInfo
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let rawInfo = try container.decodeIfPresent(CoinRAW.self, forKey: .RAW)
        let coinInfo = try container.decode(CoinInfo.self, forKey: .CoinInfo)
        
        shortName = coinInfo.Name
        name = coinInfo.FullName
        imageUrl = coinInfo.ImageUrl
        price = rawInfo?.EUR.PRICE
    }
    
    static func == (lhs: Coin, rhs: Coin) -> Bool {
        return lhs.shortName == rhs.shortName
    }
}
