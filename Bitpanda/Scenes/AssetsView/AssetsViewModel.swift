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
    var cryptocoinData: [CryptocoinView] = []
    
    private var dataApi: DataAPI
    
    init() {
        dataApi = DataAPI()
        dataApi.fetchLocal()
    }
    
    func select(assetsSelection: AssetsSelection) {
        fiatData.removeAll()
        commodityData.removeAll()
        cryptocoinData.removeAll()
        switch assetsSelection {
        case .cryptocoins:
            print("Selected cryptocoins \(dataApi.cryptocoins.count)")
            cryptocoinData = dataApi.cryptocoins
                .filter { $0.type == "cryptocoin" }
                .sorted { $0.attributes.name < $1.attributes.name }
                .map( {
                    CryptocoinView($0.attributes)
                } )
        case .commodities:
            print("Selected commodities \(dataApi.commodities.count)")
            commodityData = dataApi.commodities
                .filter { $0.type == "commodity" }
                .sorted { $0.attributes.name < $1.attributes.name }
                .map( {
                    CommodityView($0.attributes)
                } )
        case .fiats:
            populateFiats()
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AssetsUpdated"), object: nil, userInfo: nil)
    }
    
    private func populateFiats() {
        fiatData = dataApi.fiats
            .filter({ $0.attributes.hasWallets })
            .map( {
                FiatView($0.attributes)
            } )
    }
}
