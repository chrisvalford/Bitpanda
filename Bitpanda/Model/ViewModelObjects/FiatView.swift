//
//  FiatView.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

struct FiatView {
    let iconLight: URL?
    let iconDark: URL?
    let name: String
    let symbol: String
    
    init(_ attributes: FiatAttributesCD) {
        iconLight = attributes.logo
        iconDark = attributes.logoDark
        name = attributes.name ?? ""
        symbol = attributes.symbol ?? ""
    }
}
