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
