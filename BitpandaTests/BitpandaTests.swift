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
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testJSONRead() {
        let url = Bundle.main.url(forResource: "data", withExtension: ".json")
        guard let dataURL = url, let data = try? Data(contentsOf: dataURL) else {
            fatalError("Couldn't read data.json file")
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try? decoder.decode(CollectionData.self, from: data)
        XCTAssert(decoded?.wrapper.type == "collection")
    }
    
}
