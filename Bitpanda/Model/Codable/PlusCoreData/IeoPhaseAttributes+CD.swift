//
//  IeoPhaseAttributes+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension IeoPhaseAttributes {
    func save(context: NSManagedObjectContext) throws -> IeoPhaseAttributesCD {
        guard let entity = NSEntityDescription.entity(forEntityName: "IeoPhaseAttributesCD", in: context) else {
            throw CoreDataError.createEntityFailed("IeoPhaseAttributesCD")
        }
        let attributes = IeoPhaseAttributesCD(entity: entity, insertInto: context)
        attributes.name = self.name
        attributes.phaseNumber = NSNumber(integerLiteral: self.phaseNumber)
        attributes.startDate = try self.startDate.save(context: context)
        attributes.endDate = try self.endDate.save(context: context)
        attributes.maxStock = self.maxStock
        attributes.price = self.price
        attributes.active = NSNumber(booleanLiteral: self.active)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("IeoPhaseAttributesCD")
        }
        
        return attributes
    }
}
