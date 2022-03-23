//
//  AssetsViewModel.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

class AssetsViewModel {
    
    var fiatData: [FiatView] = []
    
    struct FiatView {
        let iconLight: URL
        let iconDark: URL
        let name: String
        let symbol: String
    }
    
    enum AssetsSelection {
        case all, cryptocoins, commodities, fiats
    }
    
    private var dataApi: DataAPI
    
    init() {
        dataApi = DataAPI()
        dataApi.fetchLocal()
    }
    
    func select(assetsSelection: AssetsSelection) {
        var commodities: [Commodity] = []
        
        switch assetsSelection {
        case .all:
            commodities = dataApi.cryptocoins
            commodities.append(contentsOf: dataApi.commodities)
            populateFiats()
            
        case .cryptocoins:
            commodities = dataApi.cryptocoins
        case .commodities:
            commodities = dataApi.commodities
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
