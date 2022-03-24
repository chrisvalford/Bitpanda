//
//  String+Currency.swift
//  Bitpanda
//
//  Created by Christopher Alford on 24/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

extension String {
    func formatCurrency(fractionalCount: Int) -> String {
        if self.isEmpty { return "" }
        let increment: NSDecimalNumber = 0.000000001

        // Rounds to the nearest whole number
        let handler = NSDecimalNumberHandler(roundingMode: .bankers,
                                             scale: 0,
                                             raiseOnExactness: false,
                                             raiseOnOverflow: false,
                                             raiseOnUnderflow: false,
                                             raiseOnDivideByZero: false)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let number = NSDecimalNumber(string: self)
            .dividing(by: increment)
            .rounding(accordingToBehavior: handler)
            .multiplying(by: increment)
        return formatter.string(from: number) ?? ""
    }
}
