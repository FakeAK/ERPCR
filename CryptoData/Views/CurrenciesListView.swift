//
//  CurrenciesList.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 19/02/2021.
//

import Foundation
import SwiftUI

struct CurrenciesListView: View {
    
    var currencies: [Currency] = [
        Currency(name: "Bitcoin", shortName: "BTC", price: 100000),
        Currency(name: "Bitcoin", shortName: "ETH", price: 100000),
        Currency(name: "Bitcoin", shortName: "SOL", price: 100000),
        Currency(name: "Bitcoin", shortName: "DOGE", price: 100000),
        Currency(name: "Bitcoin", shortName: "dfs", price: 100000),
        Currency(name: "Bitcoin", shortName: "dfd", price: 100000),
        Currency(name: "Bitcoin", shortName: "gfs", price: 100000),
        Currency(name: "Bitcoin", shortName: "ggff", price: 100000)
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(currencies, id: \.shortName) { item in
                    Text("\(item.shortName)")
                        .onAppear {
                            if item == currencies.last {
                                print("last")
                            }
                        }
                }
            }
        }
    }
}

struct CurrenciesListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesListView()
    }
}
