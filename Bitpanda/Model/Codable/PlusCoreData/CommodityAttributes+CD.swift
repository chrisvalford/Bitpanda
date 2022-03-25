//
//  CommodityAttributes+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension CommodityAttributes {
    func save(context: NSManagedObjectContext) throws -> CommodityAttributesCD {
        guard let entity = NSEntityDescription.entity(forEntityName: "CommodityAttributesCD", in: context) else {
            throw CoreDataError.createEntityFailed("CommodityAttributesCD")
        }
        let attributes = CommodityAttributesCD(entity: entity, insertInto: context)
        attributes.symbol = self.symbol
        attributes.name = self.name
        attributes.sort = Int16(self.sort)
        attributes.assetTypeName = self.assetTypeName
        attributes.assetGroupName = self.assetGroupName
        attributes.urlCheckAddress = self.urlCheckAddress
        attributes.urlCheckTransaction = self.urlCheckTransaction
        attributes.buyActive = self.buyActive
        attributes.sellActive = self.sellActive
        attributes.withdrawActive = self.withdrawActive
        attributes.depositActive = self.depositActive
        attributes.transferActive = self.transferActive
        attributes.available = self.available
        attributes.maintenanceEnabled = self.maintenanceEnabled
        attributes.minBuyEur = self.minBuyEur
        attributes.minSellEur = self.minSellEur
        attributes.minWithdrawEur = self.minWithdrawEur
        attributes.defaultSellAmount = self.defaultSellAmount
        attributes.precisionForFiatPrice = Int16(self.precisionForFiatPrice)
        attributes.precisionForCoins = Int16(self.precisionForCoins)
        attributes.precisionForTx = Int16(self.precisionForTx)
        attributes.walletMinDeposit = self.walletMinDeposit
        attributes.walletSmallDeposit = self.walletSmallDeposit
        attributes.walletSmallDepositFee = self.walletSmallDepositFee
        attributes.avgPrice = self.avgPrice
        attributes.color = self.color
        attributes.walletWithdrawFee = self.walletWithdrawFee
        attributes.change24H = self.change24H
        attributes.change24HAmount = self.change24HAmount
        attributes.change1W = self.change1W
        attributes.change1WAmount = self.change1WAmount
        attributes.change1M = self.change1M
        attributes.change1MAmount = self.change1MAmount
        attributes.change1Y = self.change1Y
        attributes.change1YAmount = self.change1YAmount
        attributes.logo = self.logo
        attributes.logoDark = self.logoDark
        attributes.supportDestinationTag = self.supportDestinationTag
        attributes.androidSupportedVersion = self.androidSupportedVersion
        attributes.iosSupportedVersion = self.iosSupportedVersion
        attributes.circulatingSupply = self.circulatingSupply
        attributes.allowedUnverified = self.allowedUnverified
        attributes.allowedDocumented = self.allowedDocumented
        attributes.allowedVerified = self.allowedVerified
        attributes.measurementUnit = self.measurementUnit
        for ieoPhase in ieoPhases {
            try attributes.ieoPhases?.adding(ieoPhase?.save(context: context) as Any)
        }
        attributes.info = self.info
        attributes.unavailableReason = self.unavailableReason
        attributes.maintenanceReason = self.maintenanceReason
        attributes.walletInfo = self.walletInfo
        attributes.extraInfo = self.extraInfo
        attributes.investmentInfo = self.investmentInfo
        attributes.infoIntegration = self.infoIntegration
        attributes.infoDeu = self.infoDeu
        attributes.infoEng = self.infoEng
        attributes.infoFra = self.infoFra
        attributes.unavailableReasonDeu = self.unavailableReasonDeu
        attributes.unavailableReasonEng = self.unavailableReasonEng
        attributes.unavailableReasonFra = self.unavailableReasonFra
        attributes.maintenanceReasonDeu = self.maintenanceReasonDeu
        attributes.maintenanceReasonEng = self.maintenanceReasonEng
        attributes.maintenanceReasonFra = self.maintenanceReasonFra
        attributes.walletInfoDeu = self.walletInfoDeu
        attributes.walletInfoEng = self.walletInfoEng
        attributes.walletInfoFra = self.walletInfoFra
        attributes.extraInfoDeu = self.extraInfoDeu
        attributes.extraInfoEng = self.extraInfoEng
        attributes.extraInfoFra = self.extraInfoFra
        attributes.investmentInfoDeu = self.investmentInfoDeu
        attributes.investmentInfoEng = self.investmentInfoEng
        attributes.investmentInfoFra = self.investmentInfoFra
        attributes.infoIntegrationDeu = self.infoIntegrationDeu
        attributes.infoIntegrationEng = self.infoIntegrationEng
        attributes.infoIntegrationFra = self.infoIntegrationFra
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("CommodityAttributesCD")
        }
        
        return attributes
    }
}
