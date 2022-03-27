//
//  JSONCache.swift
//  ParisForecast (iOS)
//
//  Created by Christopher Alford on 22/2/22.
//

import CoreData
import PocketSVG
import UIKit

/*
 CoreData entity is: CacheItem
 with attributes:
 url: URL
 data: Data
 savedOn: Date
*/

final class ImageCache {

    static let shared = ImageCache()

    let context = CoreDataStack.shared.persistentContainer.newBackgroundContext()
    
    class func image(path: URL, size: CGSize) -> UIImage {
        let svgView = SVGImageView.init(contentsOf: path)
        svgView.frame = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContext(svgView.bounds.size)
        svgView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }

    // The forecast interval seems to be 3 hours
    let expireAfter = TimeInterval(60*10) // TimeInterval((60*60*3) + 10)

    func add(url: URL, data: Data) {
        // select CacheItem where url == url
        // if not exists save otherwise update
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CacheItem")
        request.predicate = NSPredicate(format: "url == %@", url as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(key: "savedOn", ascending: false)]
        do {
            let result = try context.fetch(request).first as? CacheItem
            if result != nil {
                result?.data = data
                result?.savedOn = Date()
                try context.save()
            } else {
                let newItem = CacheItem(context: context)
                newItem.url = url
                newItem.data = data
                newItem.savedOn = Date()
                try context.save()
            }
        } catch {
            print(error)
        }
    }

    func fetch(url: URL) -> Data? {
        // select CacheItem where url == url
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CacheItem")
        request.predicate = NSPredicate(format: "url == %@", url as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(key: "savedOn", ascending: false)]
        do {
            let result = try context.fetch(request).first as? CacheItem
            return result?.data
        } catch {
            print(error)
        }
        return nil
    }

    func expire(url: URL) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CacheItem")
        request.includesPropertyValues = false
        request.predicate = NSPredicate(format: "url == %@", url as CVarArg)
        do {
            let objects = try context.fetch(request)
            for object in objects {
                context.delete(object as! NSManagedObject)
            }
            try context.save()
        } catch {
            print(error)
        }
    }

    func expireAll() {
        // select CacheItem where (savedOn + expireAfter) < .now
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CacheItem")
        request.includesPropertyValues = false
        request.predicate = NSPredicate(format: "savedOn < %@", Date(timeIntervalSinceNow: -expireAfter) as CVarArg)
        do {
            let objects = try context.fetch(request)
            for object in objects {
                context.delete(object as! NSManagedObject)
            }
            try context.save()
        } catch {
            print(error)
        }
    }
}
