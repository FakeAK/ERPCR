//
//  CryptoCompare.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 20/02/2021.
//

import Foundation
import Combine

extension API {
    
    static func fetchCryptoCurrencies() -> AnyPublisher<APIResponse<[Coin]>, Error>? {
        guard let url = URL(string: "\(API.ROOT_URL)\(Routes.availableCoinsList.rawValue)") else {
            return nil
        }
        
        return request(url, method: .get)
    }
    
    static func fetchMarketCapFullData(page: Int, limit: Int, currencySymbol: String) -> AnyPublisher<APIResponse<CryptoCompareAPIResponse>, Error>? {
        guard let url = URL(
                string: String(
                    format: "\(API.ROOT_URL)\(Routes.marketCapFullData.rawValue)",
                    page,
                    limit,
                    currencySymbol
                )
        ) else {
            return nil
        }
        
        return request(url, method: .get)
    }
    
    static func fetchCoinVolume(coinSymbol: String, currencySymbol: String, limit: Int) -> AnyPublisher<APIResponse<CoinVolumeAPIResponse>, Error>? {
        guard let endpoint = URL(
                string: String(
                    format: "\(API.ROOT_URL)\(Routes.coinVolume.rawValue)",
                    coinSymbol,
                    currencySymbol,
                    limit
                )
        ) else {
            return nil
        }
        
        return request(endpoint, method: .get)
    }
}
