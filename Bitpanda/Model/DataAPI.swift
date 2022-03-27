//
//  DataAPI.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 anapp4that. All rights reserved.
//

import CoreData
import UIKit

/// Simple Data API using the supplied JSON
/// Will be replace with remote service which caches the json string
/// and uses it when the network is not available
public class DataAPI {
    
    public static let shared = DataAPI()
    
    // From struct CollectionDataAttributes
    private var cryptocoins: [Cryptocoin] = []
    public var commodities: [Commodity] = []
    public var fiats: [Fiat] = []
    public var wallets: [Wallet] = []
    public var commodityWallets: [Wallet] = []
    public var fiatWallets: [FiatWallet] = []
    
    /// Use the local json
    func fetchLocal() {
        // Hack just for sample data
        if !allCryptocoins().isEmpty {
            return
        }
        let url = Bundle.main.url(forResource: "data", withExtension: ".json")
        guard let dataURL = url, let data = try? Data(contentsOf: dataURL) else {
            fatalError("Couldn't read data.json file")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try? decoder.decode(CollectionData.self, from: data)
        commodities = decoded?.wrapper.attributes.commodities ?? []
        cryptocoins = decoded?.wrapper.attributes.cryptocoins ?? []
        fiats = decoded?.wrapper.attributes.fiats ?? []
        wallets = decoded?.wrapper.attributes.wallets ?? []
        commodityWallets = decoded?.wrapper.attributes.commodityWallets ?? []
        fiatWallets = decoded?.wrapper.attributes.fiatWallets ?? []
        
        let context = CoreDataStack.shared.persistentContainer.newBackgroundContext()
        do {
            for coin in cryptocoins {
                try coin.save(context: context)
            }
            for commodity in commodities {
                try commodity.save(context: context)
            }
            for fiat in fiats {
                try fiat.save(context: context)
            }
            for wallet in wallets {
                try wallet.save(context: context)
            }
            for wallet in commodityWallets {
                try wallet.save(context: context)
            }
            for wallet in fiatWallets {
                try wallet.save(context: context)
            }
        } catch {
            print(error)
        }
    }
    
    func allCryptocoins() -> [CryptocoinCD] {
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<CryptocoinCD>
        fetchRequest = CryptocoinCD.fetchRequest()

//        fetchRequest.predicate = NSPredicate(
//            format: "name LIKE %@", "Robert"
//        )
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "attributes.sort", ascending: true)]
        var objects: [CryptocoinCD]
        do {
            objects = try context.fetch(fetchRequest)
            return objects
        } catch {
            print(error)
        }
        return []
    }
    
    func allCommodies() -> [CommodityCD] {
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<CommodityCD>
        fetchRequest = CommodityCD.fetchRequest()

//        fetchRequest.predicate = NSPredicate(
//            format: "name LIKE %@", "Robert"
//        )
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "attributes.sort", ascending: true)]
        var objects: [CommodityCD]
        do {
            objects = try context.fetch(fetchRequest)
            return objects
        } catch {
            print(error)
        }
        return []
    }
    
    // "cryptocoin_id": "8", for wallet and commodityWallet
    func walletImage(forId: String) -> (URL?,URL?) {
        if let cryptocoin = cryptocoins.first(where: { $0.id == forId }) {
            return (cryptocoin.attributes.logo, cryptocoin.attributes.logoDark)
        }
        if let commodity = commodities.first(where: { $0.id == forId }) {
            return (commodity.attributes.logo, commodity.attributes.logoDark)
        }
        return (nil, nil)
    }
    
    // "fiat_id": "4",
    func fiatWalletImage(forId: String) -> (URL?, URL?) {
        if let fiat = fiats.first(where: { $0.id == forId }) {
            return (fiat.attributes.logo, fiat.attributes.logoDark)
        }
        return (nil, nil)
    }
}
