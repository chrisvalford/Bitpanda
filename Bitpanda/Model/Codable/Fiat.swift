//
//  Fiat.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

struct Fiat: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: FiatAttributes
}

struct FiatAttributes: Codable {
    let symbol: String
    let name: String
    let precision: Int
    let toEurRate: String
    let defaultSellAmount: String
    let numericCharacterReference: String
    let minWithdrawEuro: String
    let symbolCharacter: String
    let hasWallets: Bool
    let logo: URL
    let logoDark: URL
    let logoWhite: URL
    let logoColor: URL
    let nameDeu: String
    let nameEng: String
    let nameFra: String
}
