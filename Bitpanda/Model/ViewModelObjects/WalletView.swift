//
//  WalletView.swift
//  Bitpanda
//
//  Created by Christopher Alford on 24/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

/*
 - Each wallet must be in its proper group.
 - It is up to you to decide how grouping is achieved, either by showing multiple lists or grouped items and then opening a new screen with the list of the corresponding wallets on selection etc.
 - In each wallet group, the wallets must be sorted in a descending order by balance.

 ### Fiat Wallets, Wallets, Commodity Wallets:

 - Each list item must contain the wallet's name, asset symbol, asset icon and the balance.
 - If the wallet is the default wallet (see properties in the Masterdata), mark it in a meaningful and visible way.
 - Do not display deleted wallets (see properties in the Masterdata).
 - Make sure the fiat wallets are design-wise distinguishable from wallets or commodity wallets.
 */

import Foundation

struct WalletView: Identifiable {
//    let uuid: String?
    let id: String?
    var iconLight: URL?
    var iconDark: URL?
    let name: String
    let symbol: String
    let balance: String
    var pendingTransactionCount: Int = 0
    var isDefault: Bool = false
    var isFiat: Bool = false
    
//    init(id: String, attributes: WalletAttributesCD, icon: (URL?,URL?)) {
    init(_ attributes: WalletAttributesCD) {
        isFiat = true
        self.id = attributes.id ?? ""
        name = attributes.name ?? ""
        symbol = attributes.symbol ?? ""
        pendingTransactionCount = attributes.pendingTransactionsCount?.intValue ?? 0
        isDefault = (attributes.isDefault != nil)
        balance = attributes.balance?.removeTrailingZeros() ?? ""
//        self.iconLight = icon.0
//        self.iconDark = icon.1
    }
}

// averagePrice = attributes.avgPrice.formatCurrency(fractionalCount: attributes.precisionForFiatPrice)
