//
//  FiatAttributes+CD.swift
//  Bitpanda
//
//  Created by Christopher Alford on 25/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import CoreData
import Foundation

extension FiatAttributes {
    func save(context: NSManagedObjectContext) throws -> FiatAttributesCD {
        guard let entity = NSEntityDescription.entity(forEntityName: "FiatAttributesCD", in: context) else {
            throw CoreDataError.createEntityFailed("FiatAttributesCD")
        }
        let attributes = FiatAttributesCD(entity: entity, insertInto: context)
        attributes.symbol = self.symbol
        attributes.name = self.name
        attributes.precision = NSNumber(integerLiteral: self.precision)
        attributes.toEurRate = self.toEurRate
        attributes.defaultSellAmount = self.defaultSellAmount
        attributes.numericCharacterReference = self.numericCharacterReference
        attributes.minWithdrawEuro = self.minWithdrawEuro
        attributes.symbolCharacter = self.symbolCharacter
        attributes.hasWallets = NSNumber(booleanLiteral: self.hasWallets)
        attributes.logo = self.logo
        attributes.logoDark = self.logoDark
        attributes.logoWhite = self.logoWhite
        attributes.logoColor = self.logoColor
        attributes.nameDeu = self.nameDeu
        attributes.nameEng = self.nameEng
        attributes.nameFra = self.nameFra
        
        do {
            try context.save()
        } catch {
            throw CoreDataError.saveFailed("FiatAttributesCD")
        }
        
        return attributes
    }
}
