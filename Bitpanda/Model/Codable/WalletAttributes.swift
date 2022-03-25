//
//  WalletAttributes.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

public struct WalletAttributes: Codable {
    public let cryptocoinId: String
    public let cryptocoinSymbol: String
    public let balance: String
    public let isDefault: Bool
    public let name: String
    public let pendingTransactionsCount: Int
    public let deleted: Bool
}
