//
//  CurrenciesList.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 19/02/2021.
//

import Foundation
import SwiftUI

struct CurrenciesListView: View {
    
    var currencies: [Coin]
    var didReachEnd: (() -> Void)?
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(currencies, id: \.shortName) { coin in
                    NavigationLink(
                        destination: CryptoDetailsView(coin: coin)
                            .navigationBarTitle("", displayMode: .inline)
                    ) {
                        HStack {
                            Text(coin.name)
                            Text("\(coin.shortName)")
                            Text("\(coin.price ?? 0)")
                        }
                    }.onAppear {
                        if coin == currencies.last {
                            didReachEnd?()
                        }
                    }
                }
            }
        }
    }
}

struct CurrenciesListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesListView(currencies: [], didReachEnd: {})
    }
}
