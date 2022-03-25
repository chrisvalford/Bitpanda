//
//  AppDelegate.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
#if targetEnvironment(simulator)
    if let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
        print("Documents Directory: \(documentsPath)")
    }
#endif
        
        // TODO: Remove this once API is completed and no longer a singleton
        let dataApi = DataAPI.shared
        dataApi.fetchLocal()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) {
        //CoreDataStack.shared.saveContext()
    }
}

