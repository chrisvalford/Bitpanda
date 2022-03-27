//
//  JSONCache.swift
//  Bitpanda
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
    
    class func image(path: URL, size: CGSize) -> UIImage {
        if let data = fetch(url: path) {
            guard let image = UIImage(data: data) else {
                return UIImage()
            }
            return image
        }
        let svgView = SVGImageView.init(contentsOf: path)
        svgView.frame = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContext(svgView.bounds.size)
        svgView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let data = image?.pngData() else {
            return UIImage()
        }
        add(url: path, data: data)
        return image ?? UIImage()
    }

    static let expireAfter = TimeInterval((60*60*3) + 10)

    static func add(url: URL, data: Data) {
        let context = CoreDataStack.shared.persistentContainer.newBackgroundContext()
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

    class func fetch(url: URL) -> Data? {
        let context = CoreDataStack.shared.persistentContainer.newBackgroundContext()
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

    class func expire(url: URL) {
        let context = CoreDataStack.shared.persistentContainer.newBackgroundContext()
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

    class func expireAll() {
        let context = CoreDataStack.shared.persistentContainer.newBackgroundContext()
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
