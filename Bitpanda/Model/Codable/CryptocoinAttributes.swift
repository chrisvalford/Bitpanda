//
//  CryptocoinAttributes.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

public struct CryptocoinAttributes: Codable {
    public let symbol: String
    public let name: String
    public let sort: Int
    public let assetTypeName: String
    public let assetGroupName: String
    public let urlCheckAddress: String
    public let urlCheckTransaction: String
    public let buyActive: Bool
    public let sellActive: Bool
    public let withdrawActive: Bool
    public let depositActive: Bool
    public let transferActive: Bool
    public let available: Bool
    public let maintenanceEnabled: Bool
    public let minBuyEur: String
    public let minSellEur: String
    public let minWithdrawEur: String
    public let defaultSellAmount: String
    public let precisionForFiatPrice: Int
    public let precisionForCoins: Int
    public let precisionForTx: Int
    public let walletMinDeposit: String
    public let walletSmallDeposit: String
    public let walletSmallDepositFee: String
    public let avgPrice: String
    public let color: String
    public let walletWithdrawFee: String
    public let change24H: String
    public let change24HAmount: String
    public let change1W: String
    public let change1WAmount: String
    public let change1M: String
    public let change1MAmount: String
    public let change1Y: String
    public let change1YAmount: String
    public let logo: URL
    public let logoDark: URL
    public let supportDestinationTag: Bool
    public let androidSupportedVersion: String?
    public let iosSupportedVersion: String?
    public let circulatingSupply: String?
    public let allowedUnverified: Bool
    public let allowedDocumented: Bool
    public let allowedVerified: Bool
    public let measurementUnit: String?
    public let ieoPhases: [IeoPhase?]
    public let info: String
    public let unavailableReason: String
    public let maintenanceReason: String
    public let walletInfo: String
    public let extraInfo: String
    public let investmentInfo: String?
    public let infoIntegration: String
    public let infoDeu: String
    public let infoEng: String
    public let infoFra: String
    public let unavailableReasonDeu: String
    public let unavailableReasonEng: String
    public let unavailableReasonFra: String
    public let maintenanceReasonDeu: String
    public let maintenanceReasonEng: String
    public let maintenanceReasonFra: String
    public let walletInfoDeu: String
    public let walletInfoEng: String
    public let walletInfoFra: String
    public let extraInfoDeu: String
    public let extraInfoEng: String
    public let extraInfoFra: String
    public let investmentInfoDeu: String?
    public let investmentInfoEng: String?
    public let investmentInfoFra: String?
    public let infoIntegrationDeu: String
    public let infoIntegrationEng: String
    public let infoIntegrationFra: String
}
