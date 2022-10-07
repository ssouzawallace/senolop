//
//  SenolopTests.swift
//  SenolopTests
//
//  Created by Wallace Silva on 06/10/22.
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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCalculator() {
        var sut = RPNCalculator()
        
        sut.digitPressed(9)
        sut.digitPressed(0)
        sut.digitPressed(1)
        
        let expectiation = XCTestExpectation(description: "Sum")
        if let element = sut.stack.first, element.value == 901 {
            expectiation.fulfill()
        }
    }
    
    func testSum() {
        var sut = RPNCalculator()
        
        sut.digitPressed(9)
        sut.digitPressed(0)
        sut.digitPressed(1)
        sut.plusPressed()
        sut.plusPressed()
        
        let expectiation = XCTestExpectation(description: "Sum")
        if let element = sut.stack.first, element.value == 10 {
            expectiation.fulfill()
        }
    }
    
    func testSubtraction() {
        var sut = RPNCalculator()
        
        sut.digitPressed(9)
        sut.digitPressed(0)
        sut.digitPressed(1)
        sut.minusPressed()
        
        let expectiation = XCTestExpectation(description: "Subtraction")
        if let element = sut.stack.first, element.value == -1 {
            expectiation.fulfill()
        }
    }
}
