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
    let type: String
    let attributes: CollectionDataAttributes
}

struct CollectionDataAttributes: Codable {
    let cryptocoins: [Commodity]
    let commodities: [Commodity]
    let fiats: [Fiat]
    let wallets: [Wallet]
    let commodityWallets: [Wallet]
    let fiatwallets: [FiatWallet]
}
