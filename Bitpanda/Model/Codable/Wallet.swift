//
//  Wallet.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

struct Wallet: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: WalletAttributes
}

struct WalletAttributes: Codable {
    let cryptocoinId: String
    let cryptocoinSymbol: String
    let balance: String
    let isDefault: Bool
    let name: String
    let pendingTransactionsCount: Int
    let deleted: Bool
}

/*
 {
   "type": "wallet",
   "attributes": {
     "cryptocoin_id": "28",
     "cryptocoin_symbol": "XAU",
     "balance": "7.17749217",
     "is_default": false,
     "name": "Gold Wallet 2",
     "pending_transactions_count": 0,
     "deleted": false
   },
   "id": "bf784330-2f83-4200-9c8c-39e059b6eb1e"
 }
 */
