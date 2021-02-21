//
//  CryptoListViewModel.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 19/02/2021.
//

import Foundation
import Combine

final class CryptoListViewModel: ObservableObject {
    
    @Published var currencies: [Coin] = []
    
    var subscriber: AnyCancellable? = nil
    var publisher: AnyPublisher<APIResponse<CryptoCompareAPIResponse>, Error>? = nil
    
    func fetchMarketData(page: Int) {
        publisher = API.fetchMarketCapFullData(page: page, limit: 20, currencySymbol: "EUR")
        subscriber = publisher?.sink(receiveCompletion: { (completion) in
            switch (completion) {
            case .failure(let error):
                print(error)
            case .finished:
                break
            }
        }, receiveValue: { (data) in
            self.currencies += data.value.Data
        })
    }
}
