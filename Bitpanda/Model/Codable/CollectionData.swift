//
//  CollectionData.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 anapp4that. All rights reserved.
//

import Foundation

// Inside of "data"
public struct CollectionData: Codable {
    
    public let wrapper: Wrapper
    
    enum CodingKeys: String, CodingKey {
        case wrapper = "data"
    }
}

public struct Wrapper: Codable {
    public let type: String
    public let attributes: CollectionDataAttributes
}

public struct CollectionDataAttributes: Codable {
    public let cryptocoins: [Cryptocoin]
    public let commodities: [Commodity]
    public let fiats: [Fiat]
    public let wallets: [Wallet]
    public let commodityWallets: [Wallet]
    public let fiatWallets: [FiatWallet]
    
    enum CodingKeys: String, CodingKey {
        case cryptocoins
        case commodities
        case fiats
        case wallets
        case commodityWallets
        case fiatWallets = "fiatwallets"
    }
}
