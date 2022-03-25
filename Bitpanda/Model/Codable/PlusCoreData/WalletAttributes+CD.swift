//
//  WalletAttributes+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension WalletAttributes {
    func save(context: NSManagedObjectContext) throws -> WalletAttributesCD {
        guard let entity = NSEntityDescription.entity(forEntityName: "WalletAttributesCD", in: context) else {
            throw CoreDataError.createEntityFailed("WalletAttributesCD")
        }
        let attributes = WalletAttributesCD(entity: entity, insertInto: context)
        attributes.cryptocoinId = self.cryptocoinId
        attributes.cryptocoinSymbol = self.cryptocoinSymbol
        attributes.balance = self.balance
        attributes.isDefault = NSNumber(booleanLiteral: self.isDefault)
        attributes.name = self.name
        attributes.pendingTransactionsCount = NSNumber(integerLiteral: self.pendingTransactionsCount)
        attributes.walletDeleted = NSNumber(booleanLiteral: self.deleted)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("WalletAttributesCD")
        }
        
        return attributes
    }
}
