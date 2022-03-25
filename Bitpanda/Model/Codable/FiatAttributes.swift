//
//  FiatAttributes.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

public struct FiatAttributes: Codable {
    public let symbol: String
    public let name: String
    public let precision: Int
    public let toEurRate: String
    public let defaultSellAmount: String
    public let numericCharacterReference: String
    public let minWithdrawEuro: String
    public let symbolCharacter: String
    public let hasWallets: Bool
    public let logo: URL
    public let logoDark: URL
    public let logoWhite: URL
    public let logoColor: URL
    public let nameDeu: String
    public let nameEng: String
    public let nameFra: String
}
