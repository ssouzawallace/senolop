//
//  Calculator.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import Foundation

struct Item: Identifiable {
    var value: Double
    let id = UUID()
}

protocol Calculator {
    var stack: [Item] { get }
    
    var cleanStateTitle: String { get }
    
    func buttonPressed()
    
    mutating func clearPressed()
    mutating func digitPressed(_ digit: UInt8)
    mutating func commaPressed()
    mutating func returnPressed()
    mutating func plusPressed()
    mutating func minusPressed()
    mutating func dividePressed()
    mutating func multiplyPressed()
    mutating func percentPressed()
    mutating func invertSignalPressed()
}

extension Calculator {
    func buttonPressed() {
        fatalError()
    }    
}


