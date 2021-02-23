//
//  ExtensionArrayTests.swift
//  CryptoDataTests
//
//  Created by Arthur Kleiber on 23/02/2021.
//

import Quick
import Nimble
@testable import CryptoData

class ExtensionArrayTests: QuickSpec {
    override func spec() {
        describe("Array Extension Tests") {
            it("Should remove duplicates from array") {
                let array = [1, 1, 2, 3, 4, 5, 10, 5, 20, 10].removeDuplicates()
                
                for number in array {
                    let filteredArray = array.filter { $0 == number }
                    expect(filteredArray.count).to(equal(1))
                }
            }
        }
    }
}
