//
//  Double.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 23/02/2021.
//

import Foundation

extension Double {
    public func toString() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = " "
        
        guard let formattedValue = formatter.string(from: NSNumber(value: self)) else { return nil }
        return formattedValue
    }
}
