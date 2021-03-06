//
//  CryptoListView.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 19/02/2021.
//

import Foundation
import SwiftUI

struct CryptoListView: View {
    
    @ObservedObject var viewModel: CryptoListViewModel = CryptoListViewModel()
    @State private var page: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                PrimarySectionTitleView(title: "Currencies")
                    .padding(.leading, 10)
                    .padding(.top, 50)
                CurrenciesListView(currencies: viewModel.currencies, didReachEnd: didReachEnd)
            }.onAppear {
                viewModel.getLocalData()
                viewModel.fetchMarketData(page: page)
            }.navigationBarHidden(true)
        }
    }
    
    func didReachEnd() {
        page = page + 1
        viewModel.fetchMarketData(page: page)
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
