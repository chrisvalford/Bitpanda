//
//  IeoPhaseDate+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension IeoPhaseDate {
    func save(context: NSManagedObjectContext) throws -> IeoPhaseDateCD {
        guard let entity = NSEntityDescription.entity(forEntityName: "IeoPhaseDateCD", in: context) else {
            throw CoreDataError.createEntityFailed("IeoPhaseDateCD")
        }
        let ieoPhaseDateCD = IeoPhaseDateCD(entity: entity, insertInto: context)
        ieoPhaseDateCD.dateIso8601 = self.dateIso8601
        ieoPhaseDateCD.unix = self.unix
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("IeoPhaseDateCD")
        }
        
        return ieoPhaseDateCD
    }
}
