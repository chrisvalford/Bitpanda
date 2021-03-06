//
//  WalletsViewModel.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

class WalletsViewModel {
    var walletData: [WalletCD] = []
    lazy var fetchedResultsController: NSFetchedResultsController<WalletCD> = {
        let fetchRequest: NSFetchRequest<WalletCD>
        fetchRequest = WalletCD.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "attributes.walletDeleted == false")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "walletGroup", ascending: true),
                                        NSSortDescriptor(key: "attributes.sort", ascending: true),
                                        NSSortDescriptor(key: "attributes.symbol", ascending: true)]
        let frc = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: CoreDataStack.shared.persistentContainer.viewContext,
            sectionNameKeyPath: "walletGroup",
            cacheName: nil)
        return frc
    }()

}
