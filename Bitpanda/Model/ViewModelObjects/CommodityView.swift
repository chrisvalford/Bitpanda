//
//  CommodityView.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

struct CommodityView {
    let iconLight: URL
    let iconDark: URL
    let name: String
    let symbol: String
    let averagePrice: String

    init(_ attributes: CommodityAttributes) {
        iconLight = attributes.logo
        iconDark = attributes.logoDark
        name = attributes.name
        symbol = attributes.symbol
        averagePrice = attributes.avgPrice.formatCurrency(fractionalCount: attributes.precisionForFiatPrice)
    }
}
