//
//  CoinVolumeAPIResponse.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 22/02/2021.
//

import Foundation

final class CoinHistoricalData: Decodable {
    let time: Int
    let high: Double
    let low: Double
    let open: Double
    let close: Double
    let volumefrom: Double
    let volumeto: Double
    let conversionType: String
    let conversionSymbol: String
}

final class CoinVolumeData: Decodable {
    let Data: [CoinHistoricalData]
}

final class CoinVolumeAPIResponse: Decodable {
    let Data: CoinVolumeData
}
