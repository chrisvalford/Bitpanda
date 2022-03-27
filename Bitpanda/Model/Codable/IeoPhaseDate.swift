//
//  IeoPhaseDate.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

public struct IeoPhaseDate: Codable {
    public let dateIso8601: String
    public let unix: String
}
