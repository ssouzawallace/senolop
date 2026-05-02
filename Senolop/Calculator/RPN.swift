//
//  RPN.swift
//  Senolop
//
//  Created by Wallace Silva on 25/10/22.
//

import Foundation

struct RPN: CalculatorProtocol {
    private var clearAll = true {
        didSet {
            cleanStateTitle = clearAll ? "AC" : "C"
        }
    }
    var shouldAppend = false {
        didSet {
            addsComma = false
        }
    }
    private var addsComma = false

    var cleanStateTitle: String = "AC"

    var stack: [Item] = [Item(value: "0")]

    /// Last user-visible error, cleared on next successful action.
    var lastError: String? = nil

    var calculatorHapticsFeedbackHandler: CalculatorHapticsFeedbackHandler
    init(_ calculatorHapticsFeedbackHandler: CalculatorHapticsFeedbackHandler = DummyCalculatorHapticsFeedbackHandler()) {
        self.calculatorHapticsFeedbackHandler = calculatorHapticsFeedbackHandler
    }

    func buttonPressed() {
        calculatorHapticsFeedbackHandler.bip()
    }

    mutating func error(_ message: String = "Error") {
        calculatorHapticsFeedbackHandler.blink()
        lastError = message
    }

    private mutating func clearError() {
        lastError = nil
    }

    mutating func swapPressed() {
        buttonPressed()
        guard stack.count > 1 else {
            error("Stack too small")
            return
        }
        clearError()
        stack.swapAt(stack.count - 1, stack.count - 2)
    }

    mutating func rollUpPressed() {
        buttonPressed()
        guard !stack.isEmpty else { error("Stack empty"); return }
        clearError()
        let firstItem = stack.removeFirst()
        stack.append(firstItem)
    }

    mutating func rollDownPressed() {
        buttonPressed()
        guard !stack.isEmpty else { error("Stack empty"); return }
        clearError()
        let lastItem = stack.removeLast()
        stack.insert(lastItem, at: 0)
    }

    mutating func dropPressed() {
        buttonPressed()
        if !stack.isEmpty { stack.removeLast() }
        if stack.isEmpty {
            stack = [Item(value: "0")]
        }
        clearError()
        shouldAppend = true
    }

    mutating func digitPressed(_ digit: UInt8) {
        buttonPressed()
        guard digit <= 9 else { return }
        clearError()
        guard !shouldAppend else {
            shouldAppend = false
            if !stack.isEmpty { stack.removeLast() }
            stack.append(Item(value: String(digit)))
            clearAll = false
            return
        }

        clearAll = false
        guard var value = stack.popLast()?.value else {
            stack.append(Item(value: String(digit)))
            return
        }
        if addsComma {
            if value.contains(".") || value.contains(",") {
                stack.append(Item(value: value + String(digit)))
            } else {
                stack.append(Item(value: value + "." + String(digit)))
            }
        } else {
            if value == "0" { value = "" }
            stack.append(Item(value: value + String(digit)))
        }
    }

    mutating func commaPressed() {
        buttonPressed()
        clearError()
        addsComma = true
    }

    mutating func clearPressed() {
        buttonPressed()
        clearError()
        if clearAll {
            stack = []
        } else {
            clearAll = true
            if !stack.isEmpty { stack.removeLast() }
        }
        stack.append(Item(value: "0"))
        shouldAppend = false
    }

    mutating func invertSignalPressed() {
        buttonPressed()
        guard let element = stack.popLast() else {
            error("Stack empty")
            return
        }
        clearError()
        if element.value.first == "-" {
            stack.append(Item(value: element.value.trimmingCharacters(in: ["-"])))
        } else {
            stack.append(Item(value: "-" + element.value))
        }
        shouldAppend = true
    }

    mutating func returnPressed() {
        buttonPressed()
        guard let newElement = stack.last else {
            error("Stack empty")
            return
        }
        clearError()
        stack.append(Item(value: newElement.value))
        shouldAppend = true
    }

    mutating func percentPressed() {
        buttonPressed()
        guard let element = stack.popLast(), let value = element.doubleValue else {
            error("Stack empty")
            return
        }
        clearError()
        stack.append(Item(value: String(value / 100.0)))
        shouldAppend = true
    }

    private mutating func binaryOp(_ op: (Double, Double) -> Double, name: String = "Op") {
        guard stack.count > 1 else {
            error("Stack too small")
            return
        }
        guard let b = stack.popLast()?.doubleValue,
              let a = stack.popLast()?.doubleValue else {
            error("Invalid number")
            return
        }
        let result = op(a, b)
        if result.isNaN || result.isInfinite {
            error("Math error")
        } else {
            clearError()
        }
        stack.append(Item(value: String(result)))
        shouldAppend = true
    }

    mutating func plusPressed()     { buttonPressed(); binaryOp(+, name: "+") }
    mutating func minusPressed()    { buttonPressed(); binaryOp(-, name: "-") }
    mutating func multiplyPressed() { buttonPressed(); binaryOp(*, name: "×") }
    mutating func dividePressed()   {
        buttonPressed()
        // Guard against divide-by-zero before popping so user can fix it
        guard stack.count > 1 else { error("Stack too small"); return }
        guard let b = stack.last?.doubleValue, b != 0 else {
            error("Divide by zero")
            return
        }
        binaryOp(/, name: "÷")
    }
}

