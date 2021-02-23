//
//  Currency.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 19/02/2021.
//

import Foundation
import RealmSwift

final class EurCoinRawInfo: Decodable {
    let PRICE: Double
}

final class CoinRAW: Decodable {
    let EUR: EurCoinRawInfo
}

final class CoinInfo: Decodable {
    let Id: String
    let Name: String
    let FullName: String
    let ImageUrl: String
}

final class Coin: Object, Decodable {
    
    public override static func primaryKey() -> String? {
        return "id"
    }
    
    @objc dynamic var id: String = ""
    @objc dynamic var shortName: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var imageUrl: String = ""
    let price = RealmOptional<Double>()
    
    enum CodingKeys: String, CodingKey {
        case RAW
        case CoinInfo
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let rawInfo = try container.decodeIfPresent(CoinRAW.self, forKey: .RAW)
        let coinInfo = try container.decode(CoinInfo.self, forKey: .CoinInfo)
        
        id = coinInfo.Id
        shortName = coinInfo.Name
        name = coinInfo.FullName
        imageUrl = coinInfo.ImageUrl
        price.value = rawInfo?.EUR.PRICE
    }
    
    override init() {}
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let coin = object as? Coin else {
            return false
        }
        
        return self.id == coin.id
    }
}
