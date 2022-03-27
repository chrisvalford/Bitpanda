//
//  Fiat+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension Fiat {
    
    func save(context: NSManagedObjectContext) throws {
        guard let entity = NSEntityDescription.entity(forEntityName: "FiatCD", in: context) else {
            throw CoreDataError.createEntityFailed("FiatCD")
        }
        let fiat = FiatCD(entity: entity, insertInto: context)
        fiat.id = self.id
        fiat.type = self.type
        fiat.attributes = try self.attributes.save(context: context)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("FiatCD")
        }
    }
}
