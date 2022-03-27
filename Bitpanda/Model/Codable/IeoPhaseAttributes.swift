//
//  IeoPhaseAttributes.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

public struct IeoPhaseAttributes: Codable {
    public let name: String
    public let phaseNumber: Int
    public let startDate: IeoPhaseDate
    public let endDate: IeoPhaseDate
    public let maxStock: String
    public let price: String
    public let active: Bool
}
