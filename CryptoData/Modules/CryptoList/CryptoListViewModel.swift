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
    
    public func fetchMarketData(page: Int) {
        publisher = API.fetchMarketCapFullData(page: page, limit: 20, currencySymbol: "EUR")
        subscriber = publisher?.sink(receiveCompletion: { (completion) in
            switch (completion) {
            case .failure(let error):
                print(error)
            case .finished:
                break
            }
        }, receiveValue: { [weak self] (data) in
            guard let self = self else { return }
            let coins = self.currencies + data.value.Data
            self.currencies = coins.removeDuplicates()
            self.saveDataLocally(data: data.value.Data)
        })
    }
    
    public func getLocalData() {
        guard let localData = LocalStorageHelper.default.get(Coin.self) else { return }
        currencies = Array(localData).removeDuplicates()
    }
    
    private func saveDataLocally(data: [Coin]) {
        do {
            try LocalStorageHelper.default.store(data)
        } catch {
            print(error)
        }
    }
}
