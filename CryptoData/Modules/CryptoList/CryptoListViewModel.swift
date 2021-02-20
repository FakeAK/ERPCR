//
//  CryptoListViewModel.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 19/02/2021.
//

import Foundation

final class CryptoListViewModel: ObservableObject {
    
    @Published var currencies: [Currency]?
}
