//
//  CryptoDetailsViewController.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 21/02/2021.
//

import Foundation
import UIKit

class CryptoDetailsViewController: UIViewController {
    
    // MARK: - Attributes
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
