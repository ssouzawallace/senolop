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
        XCTAssertEqual(calculator.stack.last?.value, String(1134))
    }
    
    func testComma() throws {
        var calculator: Calculator = RPN()
        calculator.commaPressed()
        calculator.digitPressed(0)
        calculator.digitPressed(1)
        calculator.digitPressed(4)
        calculator.digitPressed(0)
        calculator.digitPressed(3)
        XCTAssertEqual(calculator.stack.last?.value, String(0.01403))
    }
    
    func testPlus() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.digitPressed(1)
        calculator.returnPressed()
        calculator.digitPressed(3)
        calculator.digitPressed(4)
        calculator.plusPressed()
        XCTAssertEqual(calculator.stack.last?.value, String(11.0 + 34.0))
    }
    
    func testMinus() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.digitPressed(1)
        calculator.returnPressed()
        calculator.digitPressed(3)
        calculator.digitPressed(4)
        calculator.minusPressed()
        XCTAssertEqual(calculator.stack.last?.value, String(11.0 - 34.0))
    }
    
    func testMultiply() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.digitPressed(1)
        calculator.returnPressed()
        calculator.digitPressed(3)
        calculator.digitPressed(4)
        calculator.multiplyPressed()
        XCTAssertEqual(calculator.stack.last?.value, String(11.0 * 34.0))
    }
    
    func testDivide() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.digitPressed(1)
        calculator.returnPressed()
        calculator.digitPressed(3)
        calculator.digitPressed(4)
        calculator.dividePressed()
        XCTAssertEqual(calculator.stack.last?.value, String(11.0 / 34.0))
    }
    
    func testPercent() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.digitPressed(1)
        calculator.percentPressed()
        XCTAssertEqual(calculator.stack.last?.value, String(11.0 / 100.0))
    }
    
    func testInvertSignal() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.digitPressed(1)
        calculator.invertSignalPressed()
        XCTAssertEqual(calculator.stack.last?.value, String(-11))
    }
    
    func testClear() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.returnPressed()
        calculator.digitPressed(1)
        calculator.returnPressed()
        calculator.clearPressed()
        calculator.clearPressed()
        XCTAssertEqual(calculator.stack.count, 1)
        XCTAssertEqual(calculator.stack.last?.value, String(0))
    }
    
    func testSwap() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.returnPressed()
        calculator.digitPressed(2)
        XCTAssertEqual(calculator.stack.last?.value, String(2))
        XCTAssertEqual(calculator.stack[calculator.stack.count - 2].value, String(1))
        calculator.swapPressed()
        XCTAssertEqual(calculator.stack.last?.value, String(1))
        XCTAssertEqual(calculator.stack[calculator.stack.count - 2].value, String(2))
    }
    
    func testRollDown() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.returnPressed()
        calculator.digitPressed(2)
        calculator.returnPressed()
        calculator.digitPressed(3)
        calculator.rollDownPressed()
        XCTAssertEqual(calculator.stack.last?.value, String(2))
    }
    
    func testRollUp() throws {
        var calculator: Calculator = RPN()
        calculator.digitPressed(1)
        calculator.returnPressed()
        calculator.digitPressed(2)
        calculator.returnPressed()
        calculator.digitPressed(3)
        calculator.rollUpPressed()
        XCTAssertEqual(calculator.stack.last?.value, String(1))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
