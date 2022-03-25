//
//  FiatWalletAttributes.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

public struct FiatWalletAttributes: Codable {
    public let fiatId: String
    public let fiatSymbol: String
    public let balance: String
    public let name: String
    public let pendingTransactionsCount: Int
}
