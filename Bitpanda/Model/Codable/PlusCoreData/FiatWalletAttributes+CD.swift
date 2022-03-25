//
//  FiatWalletAttributes+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension FiatWalletAttributes {
    func save(context: NSManagedObjectContext) throws -> FiatWalletAttributesCD {
        guard let entity = NSEntityDescription.entity(forEntityName: "FiatWalletAttributesCD", in: context) else {
            throw CoreDataError.createEntityFailed("FiatWalletAttributesCD")
        }
        let attributes = FiatWalletAttributesCD(entity: entity, insertInto: context)
        attributes.fiatId = self.fiatId
        attributes.fiatSymbol = self.fiatSymbol
        attributes.balance = self.balance
        attributes.name = self.name
        attributes.pendingTransactionsCount = NSNumber(integerLiteral: self.pendingTransactionsCount)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("FiatWalletAttributesCD")
        }
        
        return attributes
    }
}
