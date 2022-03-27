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
    var fiatData: [FiatCD] = []
    var commodityData: [CommodityCD] = []
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
            commodityData = dataApi.allCommodies()
        case .fiats:
            fiatData = dataApi.allFiats()
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AssetsUpdated"), object: nil, userInfo: nil)
    }
}
