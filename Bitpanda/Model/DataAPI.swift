//
//  DataAPI.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 anapp4that. All rights reserved.
//

import Foundation

/// Simple Data API using the supplied JSON
/// Will be replace with remote service which caches the json string
/// and uses it when the network is not available
public class DataAPI {
    
    // From struct CollectionDataAttributes
    public var cryptocoins: [Commodity] = []
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
        cryptocoins = decoded?.wrapper.attributes.cryptocoins ?? []
        commodities = decoded?.wrapper.attributes.commodities ?? []
        fiats = decoded?.wrapper.attributes.fiats ?? []
        wallets = decoded?.wrapper.attributes.wallets ?? []
        commodityWallets = decoded?.wrapper.attributes.commodityWallets ?? []
        fiatWallets = decoded?.wrapper.attributes.fiatWallets ?? []
    }
}
