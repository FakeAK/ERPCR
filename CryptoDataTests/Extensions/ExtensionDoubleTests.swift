//
//  ExtensionDoubleTests.swift
//  CryptoDataTests
//
//  Created by Arthur Kleiber on 23/02/2021.
//

import Quick
import Nimble
@testable import CryptoData

class ExtensionDoubleTests: QuickSpec {
    override func spec() {
        describe("Double Extension Tests") {
            it("Should get a formatted string price from Double") {
                let bitcoinPrice = 45860.289834
                expect(bitcoinPrice.toString()).to(equal("45 860,29"))
            }
        }
    }
}
