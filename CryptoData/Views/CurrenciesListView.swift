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
                ForEach(currencies, id: \.shortName) { item in
                    NavigationLink(destination: CryptoListView()) {
                        HStack {
                            Text(item.name)
                            Text("\(item.shortName)")
                            Text("\(item.price ?? 0)")
                        }
                    }.onAppear {
                        if item == currencies.last {
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
