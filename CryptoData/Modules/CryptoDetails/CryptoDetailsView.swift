//
//  CryptoDetailsView.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 21/02/2021.
//

import Foundation
import SwiftUI

struct CryptoDetailsView: UIViewControllerRepresentable {
    typealias UIViewControllerType = CryptoDetailsViewController
    
    let coin: Coin
    
    func makeUIViewController(context: Context) -> CryptoDetailsViewController {
        return CryptoDetailsViewController(coin: coin)
    }
    
    func updateUIViewController(_ uiViewController: CryptoDetailsViewController, context: Context) {
        
    }
}
