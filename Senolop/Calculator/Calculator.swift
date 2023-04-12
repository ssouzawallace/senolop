//
//  Calculator.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import Foundation

extension Int {
    func fact() -> Int {
        if self == 0 { return 1 }
        return self*(self-1).fact()
    }
}

protocol Calculator {
    func buttonPressed()
}

extension Calculator {
    func buttonPressed() {
        fatalError()
    }
}


