//
//  Commodity+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension Commodity {
    func save(context: NSManagedObjectContext) throws {
        guard let entity = NSEntityDescription.entity(forEntityName: "CommodityCD", in: context) else {
            throw CoreDataError.createEntityFailed("CommodityCD")
        }
        let commodity = CommodityCD(entity: entity, insertInto: context)
        commodity.id = self.id
        commodity.type = self.type
        commodity.attributes = try self.attributes.save(context: context)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("CommodityCD")
        }
    }
}
