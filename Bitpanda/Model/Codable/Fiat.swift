//
//  Fiat.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 anapp4that. All rights reserved.
//

import Foundation

public struct Fiat: Codable, Identifiable {
    public let id: String
    public let type: String
    public let attributes: FiatAttributes
}

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
