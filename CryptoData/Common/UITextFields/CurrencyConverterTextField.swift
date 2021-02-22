//
//  CurrencyConverterTextField.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 22/02/2021.
//

import Foundation
import UIKit

final class CurrencyConverterTextField: UITextField {
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
}
