//
//  DataAPI.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 anapp4that. All rights reserved.
//

import UIKit

/// Simple Data API using the supplied JSON
/// Will be replace with remote service which caches the json string
/// and uses it when the network is not available
public class DataAPI {
    
    // From struct CollectionDataAttributes
    public var cryptocoins: [Cryptocoin] = []
    public var commodities: [Commodity] = []
    public var fiats: [Fiat] = []
    public var wallets: [Wallet] = []
    public var commodityWallets: [Wallet] = []
    public var fiatWallets: [FiatWallet] = []
    
    /// Use the local json
    func fetchLocal() {
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
        
        for coin in cryptocoins {
            do {
                try coin.save(context: context)
            } catch {
                print(error)
            }
        }
        for commodity in commodities {
            do {
                try commodity.save(context: context)
            } catch {
                print(error)
            }
        }
        for fiat in fiats {
            do {
                try fiat.save(context: context)
            } catch {
                print(error)
            }
        }
        for wallet in wallets {
            do {
                try wallet.save(context: context)
            } catch {
                print(error)
            }
        }
        for wallet in commodityWallets {
            do {
                try wallet.save(context: context)
            } catch {
                print(error)
            }
        }
        for wallet in fiatWallets {
            do {
                try wallet.save(context: context)
            } catch {
                print(error)
            }
        }
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
