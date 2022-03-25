//
//  WalletsViewModel.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

class WalletsViewModel {
    
    // For a sectioned table view we need an array of arrays.
    var walletData: [[WalletView]] = []
    let headerData = ["Wallets","Commodity Wallets","Fiat Wallets"]
    
    private var dataApi: DataAPI
    
    init() {
        dataApi = DataAPI.shared
        let wallets = dataApi.wallets
            .filter { $0.type == "wallet" && $0.attributes.deleted == false }
            .sorted { $0.attributes.name < $1.attributes.name }
            .map( {
                WalletView(id: $0.id, attributes: $0.attributes, icon: dataApi.walletImage(forId: $0.attributes.cryptocoinId))
            } )
        walletData.append(contentsOf: [wallets])
        let commodityWallets = dataApi.commodityWallets
            .filter { $0.type == "wallet" && $0.attributes.deleted == false }
            .sorted { $0.attributes.name < $1.attributes.name }
            .map( {
                WalletView(id: $0.id, attributes: $0.attributes, icon: dataApi.walletImage(forId: $0.attributes.cryptocoinId))
            } )
        walletData.append(contentsOf: [commodityWallets])
        let fiatWallets = dataApi.fiatWallets
            .filter { $0.type == "fiat_wallet" }
            .sorted { $0.attributes.name < $1.attributes.name }
            .map( {
                WalletView(id: $0.id, attributes: $0.attributes, icon: dataApi.fiatWalletImage(forId: $0.attributes.fiatId))
            } )
        walletData.append(contentsOf: [fiatWallets])
    }
}
