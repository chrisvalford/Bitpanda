//
//  DataAPI.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 anapp4that. All rights reserved.
//

import Foundation

public class DataAPI {
    
    // From struct CollectionDataAttributes
    public var cryptocoins: [Commodity] = []
    public var  commodities: [Commodity] = []
    public var  fiats: [Fiat] = []
    public var  wallets: [Wallet] = []
    public var  commodityWallets: [Wallet] = []
    public var  fiatWallets: [FiatWallet] = []
    
    func fetchLocal() {
        let url = Bundle.main.url(forResource: "data", withExtension: ".json")
        guard let dataURL = url, let data = try? Data(contentsOf: dataURL) else {
            fatalError("Couldn't read data.json file")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try? decoder.decode(CollectionData.self, from: data)
        let firstFiat = decoded?.wrapper.attributes.fiats.first
    }
}




