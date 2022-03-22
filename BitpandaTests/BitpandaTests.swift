//
//  BitpandaTests.swift
//  BitpandaTests
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that.com. All rights reserved.
//

import UIKit
import XCTest

class BitpandaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJSONReadPerformance() {
        self.measure() {
            let url = Bundle.main.url(forResource: "data", withExtension: ".json")
            guard let dataURL = url, let data = try? Data(contentsOf: dataURL) else {
                fatalError("Couldn't read data.json file")
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            _ = try? decoder.decode(CollectionData.self, from: data)
        }
    }

    /// Test for any value in the whole sample JSON file, as this proves the optional fields in the structs are correct.
    func testJSONRead() {
        let url = Bundle.main.url(forResource: "data", withExtension: ".json")
        guard let dataURL = url, let data = try? Data(contentsOf: dataURL) else {
            fatalError("Couldn't read data.json file")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try? decoder.decode(CollectionData.self, from: data)
        // XCTAssert(decoded?.wrapper.type == "collection")
        let firstFiat = decoded?.wrapper.attributes.fiats.first
        XCTAssert(firstFiat?.attributes.name == "Euro")
    }
    
}
