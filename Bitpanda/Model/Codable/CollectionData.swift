//
//  CollectionData.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

// Inside of "data"
struct CollectionData: Codable {
    
    let wrapper: Wrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

struct Wrapper: Codable {
    let type: String
    let attributes: CollectionDataAttributes
}

struct CollectionDataAttributes: Codable {
    let cryptocoins: [Commodity]
    // let commodities: [Commodity] // Broken
    let fiats: [Fiat]
    let wallets: [Wallet]
    let commodityWallets: [Wallet]
    let fiatwallets: [FiatWallet] // Broken
}
