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
    
    var body: some View {
        VStack {
            PrimarySectionTitleView(title: "Currencies")
            CurrenciesListView()
        }
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
