//
//  Wallet.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 anapp4that. All rights reserved.
//

import Foundation

public struct Wallet: Codable, Identifiable {
    public let id: String
    public let type: String
    public let attributes: WalletAttributes
}

public struct WalletAttributes: Codable {
    public let cryptocoinId: String
    public let cryptocoinSymbol: String
    public let balance: String
    public let isDefault: Bool
    public let name: String
    public let pendingTransactionsCount: Int
    public let deleted: Bool
}
