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
            LazyVStack(alignment: .leading, spacing: 15) {
                ForEach(currencies, id: \.self) { coin in
                    CryptoListCell(coin: coin)
                        .onAppear {
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
