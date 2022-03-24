//
//  CodingUserInfoKey+MOC.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that. All rights reserved.
//

import Foundation

extension CodingUserInfoKey {
    // Helper property to retrieve the context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}
