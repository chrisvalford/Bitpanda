//
//  AssetsSelection.swift
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
