//
//  History.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that.com. All rights reserved.
//

import Foundation
import CoreData

class History: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var lastUpdate: Date
    @NSManaged var updatePeriod: NSNumber

}
