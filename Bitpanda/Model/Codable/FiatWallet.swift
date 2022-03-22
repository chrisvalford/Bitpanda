//
//  Wallet.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

struct FiatWallet: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: WalletAttributes
}

struct FiatWalletAttributes: Codable {
    let fiatId: String
    let fiatSymbol: String
    let balance: String
    let name: String
    let pendingTransactionsCount: Int
}

/*
 {
   "type": "fiat_wallet",
   "attributes": {
     "fiat_id": "1",
     "fiat_symbol": "EUR",
     "balance": "74.63000000",
     "name": "EUR Wallet",
     "pending_transactions_count": 1
   },
   "id": "4fc17f23-83e8-4974-a149-569fdad72a81"
 },
 */
