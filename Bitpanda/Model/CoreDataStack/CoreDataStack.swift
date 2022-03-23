//
//  CoreDataStack.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that. All rights reserved.
//

import Foundation
import CoreData

internal final class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    init() { }
    
    deinit {
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let modelURL = Bundle(for: type(of: self)).url(forResource: "Bitpanda", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        let container = NSPersistentContainer(name: "Bitpanda", managedObjectModel: managedObjectModel!)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let nserror = error as NSError? {
                debugPrint("Unable to create coredata stack, error \(nserror), \(nserror.userInfo)")
            } else {
                container.viewContext.automaticallyMergesChangesFromParent = true
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                debugPrint("Unresolved error error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
