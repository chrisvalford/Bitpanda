//
//  CoreDataStack.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataError: Error {
    case createEntityFailed(String)
    case saveFailed(String)
}

internal final class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    init() { }
    
    deinit {
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        guard let modelURL = Bundle(for: type(of: self)).url(forResource: "Bitpanda", withExtension: "mom") else {
            fatalError("Cannot find modelURL")
        }
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
