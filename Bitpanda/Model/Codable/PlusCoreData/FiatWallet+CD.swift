//
//  FiatWallet+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension FiatWallet {
    func save(context: NSManagedObjectContext) throws {
        guard let entity = NSEntityDescription.entity(forEntityName: "FiatWalletCD", in: context) else {
            throw CoreDataError.createEntityFailed("FiatWalletCD")
        }
        let fiatWallet = FiatWalletCD(entity: entity, insertInto: context)
        fiatWallet.id = self.id
        fiatWallet.type = self.type
        fiatWallet.attributes = try self.attributes.save(context: context)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("FiatWalletCD")
        }
    }
}

