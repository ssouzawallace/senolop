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
    private var shouldAppend = false {
        didSet {
            addsComma = false
        }
    }
    private var addsComma = false
    
    var cleanStateTitle: String = "AC"
    
    var stack: [Item] = [Item(value: "0")]
    
    var calculatorHapticsFeedbackHandler: CalculatorHapticsFeedbackHandler
    init(_ calculatorHapticsFeedbackHandler: CalculatorHapticsFeedbackHandler = DummyCalculatorHapticsFeedbackHandler()) {
        self.calculatorHapticsFeedbackHandler = calculatorHapticsFeedbackHandler
    }
    
    func buttonPressed() {
        calculatorHapticsFeedbackHandler.bip()
    }
    
    private func error() {
        calculatorHapticsFeedbackHandler.blink()
    }
    
    mutating func swapPressed() {
        buttonPressed()
        guard stack.count > 1 else {
            error()
            return
        }
        stack.swapAt(stack.count - 1, stack.count - 2)
    }
    
    mutating func rollUpPressed() {
        buttonPressed()
        let firstItem = stack.removeFirst()
        stack.append(firstItem)
    }
    
    mutating func rollDownPressed() {
        buttonPressed()
        let lastItem = stack.removeLast()
        stack.insert(lastItem, at: 0)
    }
    
    mutating func dropPressed() {
        buttonPressed()
        stack.removeLast()
        if stack.isEmpty {
            stack = [Item(value: "0")]
        }
        shouldAppend = true
    }
    
    mutating func digitPressed(_ digit: UInt8) {
        buttonPressed()
        guard digit >= 0 && digit <= 9 else {
            raise(0)
            return
        }
        guard !shouldAppend else {
            shouldAppend = false
            stack.removeLast()
            stack.append(Item(value: String(digit)))
            return
        }
        
        clearAll = false
        guard var value = stack.popLast()?.value else { return }
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
        addsComma = true
    }

    mutating func clearPressed() {
        buttonPressed()
        if clearAll {
            stack = []
        } else {
            clearAll = true
            stack.removeLast()
        }
        stack.append(Item(value: "0"))
        shouldAppend = false
    }
    
    mutating func invertSignalPressed() {
        buttonPressed()
        guard let element = stack.popLast() else {
            error()
            return
        }
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
            error()
            return
        }
        stack.append(Item(value: newElement.value))
        shouldAppend = true
    }

    mutating func percentPressed() {
        buttonPressed()
        guard let element = stack.popLast() else {
            error()
            return
        }
        guard let value = Double(element.value) else {
            error()
            return
        }
        stack.append(Item(value: String(value / 100.0)))
        shouldAppend = true
    }
    
    mutating func plusPressed() {
        buttonPressed()
        guard stack.count > 1 else {
            error()
            return
        }
        guard let elementB = stack.popLast()?.value else { return }
        guard let elementA = stack.popLast()?.value else { return }
        guard let elementB = Double(elementB) else { return }
        guard let elementA = Double(elementA) else { return }
        stack.append(Item(value: String(elementA + elementB)))
        shouldAppend = true
    }
    
    mutating func minusPressed() {
        buttonPressed()
        guard stack.count > 1 else {
            error()
            return
        }
        guard let elementB = stack.popLast()?.value else { return }
        guard let elementA = stack.popLast()?.value else { return }
        guard let elementB = Double(elementB) else { return }
        guard let elementA = Double(elementA) else { return }
        stack.append(Item(value: String(elementA - elementB)))
        shouldAppend = true
    }
    
    mutating func dividePressed() {
        buttonPressed()
        guard stack.count > 1 else {
            error()
            return
        }
        guard let elementB = stack.popLast()?.value else { return }
        guard let elementA = stack.popLast()?.value else { return }
        guard let elementB = Double(elementB) else { return }
        guard let elementA = Double(elementA) else { return }
        stack.append(Item(value: String(elementA / elementB)))
        shouldAppend = true
    }
    
    mutating func multiplyPressed() {
        buttonPressed()
        guard stack.count > 1 else {
            error()
            return
        }
        guard let elementB = stack.popLast()?.value else { return }
        guard let elementA = stack.popLast()?.value else { return }
        guard let elementB = Double(elementB) else { return }
        guard let elementA = Double(elementA) else { return }
        stack.append(Item(value: String(elementA * elementB)))
        shouldAppend = true
    }
}
