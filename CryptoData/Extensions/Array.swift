//
//  Array.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 22/02/2021.
//

import Foundation

extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}

