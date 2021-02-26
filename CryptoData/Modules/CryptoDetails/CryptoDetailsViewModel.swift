//
//  CryptoDetailsViewModel.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 21/02/2021.
//

import Foundation
import Combine

final class CryptoDetailsViewModel {
    
    var coinHistoricalData: [CoinHistoricalData]?
    var coin: Coin!
    
    var subscriber: AnyCancellable? = nil
    var publisher: AnyPublisher<APIResponse<CoinVolumeAPIResponse>, Error>? = nil
    
    var didFetchHistoricalData: (([CoinHistoricalData]) -> Void)?
    var didConvertCurrencyToCoin: ((Double) -> Void)?
    var didConvertCoinToCurrency: ((Double) -> Void)?
    
    deinit {
        subscriber = nil
        publisher = nil
        coinHistoricalData = nil
    }
    
    public func fetchVolume() {
        publisher = API.fetchCoinVolume(coinSymbol: coin.shortName, currencySymbol: "EUR", limit: 2000)
        subscriber = publisher?.sink(receiveCompletion: { (completion) in
            switch (completion) {
            case .failure(let error):
                print(error)
            case .finished:
                break
            }
        }, receiveValue: { [weak self] (data) in
            guard let self = self else { return }
            self.coinHistoricalData = data.value.Data.Data
            self.didFetchHistoricalData?(self.coinHistoricalData!)
        })
    }
    
    public func currencyValueDidChange(newValue: Double) {
        guard let coinPrice = coin.price.value else { return }
        
        let computedNumberOfCoins = newValue / coinPrice
        didConvertCurrencyToCoin?(computedNumberOfCoins)
    }
    
    public func coinValueDidChange(numberOfCoins: Double) {
        guard let coinPrice = coin.price.value else { return }
        
        let currencyPrice = coinPrice * numberOfCoins
        didConvertCoinToCurrency?(currencyPrice)
    }
}
