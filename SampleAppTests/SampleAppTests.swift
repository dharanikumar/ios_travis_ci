//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by DharaniKumar on 17/05/20.
//  Copyright © 2020 DharaniKumar. All rights reserved.
//

import XCTest
@testable import SampleApp

class SampleAppTests: XCTestCase {
    var testVariable: String? = "SampleTest"
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
       XCTAssertEqual("SampleTest", testVariable)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
