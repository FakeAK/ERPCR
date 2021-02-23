//
//  LocalStorageHelper.swift
//  CryptoDataTests
//
//  Created by Arthur Kleiber on 23/02/2021.
//

import Quick
import Nimble
@testable import CryptoData

class LocalStorageTests: QuickSpec {
    override func spec() {
        describe("Local Storage Helper functions tests") {
            it("Should save object") {
                let objToSave = Coin()
                objToSave.id = "testId"
                objToSave.imageUrl = ""
                objToSave.name = "Test Coin"
                objToSave.shortName = "TST"
                objToSave.price.value = 1
                
                try! LocalStorageHelper.default.store(objToSave)
                let insertedObject = LocalStorageHelper.default.get(Coin.self)?.last
                
                expect(insertedObject).toNot(beNil())
                expect(insertedObject?.id).to(equal("testId"))
                expect(insertedObject?.name).to(equal("Test Coin"))
            }
        }
    }
}
