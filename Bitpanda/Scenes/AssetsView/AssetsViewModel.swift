//
//  AssetsViewModel.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

class AssetsViewModel {
    
    var selectedAsset: AssetsSelection = .commodities {
        didSet {
            self.select(assetsSelection: selectedAsset)
        }
    }
    var fiatData: [FiatView] = []
    var commodityData: [CommodityView] = []
    
    private var dataApi: DataAPI
    
    init() {
        dataApi = DataAPI()
        dataApi.fetchLocal()
    }
    
    func select(assetsSelection: AssetsSelection) {
        switch assetsSelection {
        case .all:
            var commodities = dataApi.cryptocoins
            commodities.append(contentsOf: dataApi.commodities)
            commodityData = commodities.map( {
                CommodityView($0.attributes)
            } )
            populateFiats()
            
        case .cryptocoins:
            print("Selected cryptocoins \(dataApi.cryptocoins.count)")
            commodityData = dataApi.cryptocoins
                .sorted { $0.attributes.name < $1.attributes.name }
                .map( {
                    CommodityView($0.attributes)
                } )
            //TODO: .sorted { $0.name < $1.name }
            
        case .commodities:
            print("Selected commodities \(dataApi.commodities.count)")
            commodityData = dataApi.commodities
                .sorted { $0.attributes.name < $1.attributes.name }
                .map( {
                    CommodityView($0.attributes)
                } )
        case .fiats:
            populateFiats()
        }
    }
    
    private func populateFiats() {
        fiatData = dataApi.fiats
            .filter({ $0.attributes.hasWallets })
            .map( {
                FiatView(iconLight: $0.attributes.logo,
                         iconDark: $0.attributes.logoDark,
                         name: $0.attributes.name,
                         symbol: $0.attributes.symbol)
            } )
    }
}
