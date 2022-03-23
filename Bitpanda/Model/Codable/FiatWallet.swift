//
//  Wallet.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 anapp4that. All rights reserved.
//

import Foundation

public struct FiatWallet: Codable, Identifiable {
    public let id: String
    public let type: String
    public let attributes: FiatWalletAttributes
}

public struct FiatWalletAttributes: Codable {
    public let fiatId: String
    public let fiatSymbol: String
    public let balance: String
    public let name: String
    public let pendingTransactionsCount: Int
}
