//
//  IeoPhase.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

struct IeoPhase: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: IeoPhaseAttributes
}

struct IeoPhaseAttributes: Codable {
    let name: String
    let phaseNumber: Int
    let startDate: IeoPhaseDate
    let endDate: IeoPhaseDate
    let maxStock: String
    let price: String
    let active: Bool
}

struct IeoPhaseDate: Codable {
    let dateIso8601: String
    let unix: String
}
/*
 "ieo_phases": [
   {
     "type": "data",
     "attributes": {
       "name": "Phase 1",
       "phase_number": 1,
       "start_date": {
         "date_iso8601": "2019-07-09T12:00:00+02:00",
         "unix": "1562666400"
       },
       "end_date": {
         "date_iso8601": "2019-07-16T12:00:00+02:00",
         "unix": "1563271200"
       },
       "max_stock": "200000000.00000000",
       "price": "0.0900",
       "active": false
     },
     "id": "1"
   },
 */
