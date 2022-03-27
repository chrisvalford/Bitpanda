//
//  AssetsViewModel.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

class AssetsViewModel {
    
    var selectedAsset: AssetsSelection = .cryptocoins {
        didSet {
            self.select(assetsSelection: selectedAsset)
        }
    }
    var fiatData: [FiatView] = []
    var commodityData: [CommodityView] = []
    var cryptocoinData: [CryptocoinCD] = []
    
    private var dataApi: DataAPI
    
    init() {
        dataApi = DataAPI.shared
    }
    
    func select(assetsSelection: AssetsSelection) {
        fiatData.removeAll()
        commodityData.removeAll()
        cryptocoinData.removeAll()
        switch assetsSelection {
        case .cryptocoins:
            cryptocoinData = dataApi.allCryptocoins()
        case .commodities:
            print("Selected commodities \(dataApi.commodities.count)")
            commodityData = dataApi.commodities
                .filter { $0.type == "commodity" }
                .sorted { $0.attributes.sort < $1.attributes.sort }
                .map( {
                    CommodityView($0.attributes)
                } )
        case .fiats:
            fiatData = dataApi.fiats
                .filter({ $0.attributes.hasWallets })
                .sorted { $0.attributes.symbol < $1.attributes.symbol }
                .map( {
                    FiatView($0.attributes)
                } )
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AssetsUpdated"), object: nil, userInfo: nil)
    }
}
