//
//  Cryptocoin+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension Cryptocoin {
    func save(context: NSManagedObjectContext) throws {
        guard let entity = NSEntityDescription.entity(forEntityName: "CryptocoinCD", in: context) else {
            throw CoreDataError.createEntityFailed("CryptocoinCD")
        }
        let coin = CryptocoinCD(entity: entity, insertInto: context)
        coin.id = self.id
        coin.type = self.type
        coin.attributes = try self.attributes.save(context: context)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("CryptocoinCD")
        }
    }
}
