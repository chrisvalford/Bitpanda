//
//  IeoPhase+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension IeoPhase {
    func save(context: NSManagedObjectContext) throws -> IeoPhaseCD {
        guard let entity = NSEntityDescription.entity(forEntityName: "IeoPhaseCD", in: context) else {
            throw CoreDataError.createEntityFailed("IeoPhaseCD")
        }
        let ieoPhase = IeoPhaseCD(entity: entity, insertInto: context)
        ieoPhase.id = self.id
        ieoPhase.type = self.type
        ieoPhase.attributes = try self.attributes.save(context: context)
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("IeoPhaseCD")
        }
        
        return ieoPhase
    }
}
