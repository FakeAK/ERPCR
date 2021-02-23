//
//  LocalStorageHelper.swift
//  CryptoData
//
//  Created by Arthur Kleiber on 22/02/2021.
//

import Foundation
import RealmSwift

class LocalStorageHelper {
    
    static let `default` = LocalStorageHelper()
    var db: Realm?
    
    init() {
        db = try? Realm()
    }
}

// MARK: STORE FUNCTIONS
extension LocalStorageHelper {
    func store(_ object: Object) throws {
        guard let db = db else {
            throw "Can't reach database"
        }
        
        try save(in: db, [object])
    }
    
    func store(_ objects: [Object]) throws {
        guard let db = db else {
            throw "Can't reach database"
        }
        
        try save(in: db, objects)
    }
    
    private func save(in db: Realm, _ objects: [Object]) throws {
        do {
            try db.write {
                db.add(objects, update: .modified)
            }
        } catch let error as NSError {
            throw error
        }
    }
}


// MARK: GETTER FUNCTIONS
extension LocalStorageHelper {
    func get<T: Object>(_ type: T.Type) -> Results<T>? {
        return db?.objects(type)
    }
}
