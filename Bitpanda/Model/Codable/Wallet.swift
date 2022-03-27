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
    public var type: String
    public let attributes: WalletAttributes
}
