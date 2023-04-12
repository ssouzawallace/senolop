//
//  SenolopTests.swift
//  SenolopTests
//
//  Created by Wallace Silva on 12/04/23.
//

import XCTest
@testable import Senolop

final class SenolopTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testKeyboardBehavior() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.digitPressed(1)
        calculator.digitPressed(3)
        calculator.digitPressed(4)
        XCTAssertEqual(calculator.stack.last?.value, 1134)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
