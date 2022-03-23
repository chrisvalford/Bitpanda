//
//  AssetsViewModel.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

enum AssetsSelection: Int, CustomStringConvertible {
    case all = 0, cryptocoins, commodities, fiats
    
    static func allValues() -> [String] {
        return [all, cryptocoins, commodities, fiats].map({$0.description})
    }
    
    static func count() -> Int {
        return allValues().count
    }
    
    public var description: String {
        switch self {
        case .all:
            return "All"
        case .cryptocoins:
            return "Cryptocoins"
        case .commodities:
            return "Commodities"
        case .fiats:
            return "Fiats"
        }
    }
}

struct FiatView {
    let iconLight: URL
    let iconDark: URL
    let name: String
    let symbol: String
}

struct CommodityView {
    let iconLight: URL
    let iconDark: URL
    let name: String
    let symbol: String
    let averagePrice: String
}

class AssetsViewModel {
    
    var selectedAsset: AssetsSelection = .cryptocoins
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
                    CommodityView(iconLight: $0.attributes.logo,
                                  iconDark: $0.attributes.logoDark,
                                  name: $0.attributes.name,
                                  symbol: $0.attributes.symbol,
                                  averagePrice: $0.attributes.avgPrice)
                } )
            populateFiats()
            
        case .cryptocoins:
            commodityData = dataApi.cryptocoins
                .map( {
                    CommodityView(iconLight: $0.attributes.logo,
                                  iconDark: $0.attributes.logoDark,
                                  name: $0.attributes.name,
                                  symbol: $0.attributes.symbol,
                                  averagePrice: $0.attributes.avgPrice)
                } )
                //TODO: .sorted { $0.name < $1.name }
            
        case .commodities:
            commodityData = dataApi.commodities.map( {
                    CommodityView(iconLight: $0.attributes.logo,
                                  iconDark: $0.attributes.logoDark,
                                  name: $0.attributes.name,
                                  symbol: $0.attributes.symbol,
                                  averagePrice: $0.attributes.avgPrice)
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
