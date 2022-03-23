//
//  IeoPhase.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 anapp4that. All rights reserved.
//

import Foundation

public struct IeoPhase: Codable, Identifiable {
    public let id: String
    public let type: String
    public let attributes: IeoPhaseAttributes
}

public struct IeoPhaseAttributes: Codable {
    public let name: String
    public let phaseNumber: Int
    public let startDate: IeoPhaseDate
    public let endDate: IeoPhaseDate
    public let maxStock: String
    public let price: String
    public let active: Bool
}

public struct IeoPhaseDate: Codable {
    public let dateIso8601: String
    public let unix: String
}
