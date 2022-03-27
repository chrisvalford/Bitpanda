//
//  Wallet+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension Wallet {
    func save(type: String, context: NSManagedObjectContext) throws {
        guard let entity = NSEntityDescription.entity(forEntityName: "WalletCD", in: context) else {
            throw CoreDataError.createEntityFailed("WalletCD")
        }
        let wallet = WalletCD(entity: entity, insertInto: context)
        wallet.id = self.id
        wallet.walletGroup = type
        wallet.attributes = try self.attributes.save(context: context)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("WalletCD")
        }
    }
}
