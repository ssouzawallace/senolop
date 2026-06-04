//
//  Scientific.swift
//  Senolop
//
//  Created by Wallace Silva on 25/10/22.
//

import Foundation

extension RPN {
    /// True when the user has selected radians; false for degrees.
    /// Mirrors the AppStorage key used by Settings.
    private var useRadians: Bool {
        UserDefaults.standard.object(forKey: "use_radians_preference") as? Bool ?? true
    }

    private func toRadians(_ x: Double) -> Double { useRadians ? x : x * .pi / 180.0 }
    private func fromRadians(_ x: Double) -> Double { useRadians ? x : x * 180.0 / .pi }

    private mutating func unaryOp(_ op: (Double) -> Double) {
        guard let v = stack.popLast()?.doubleValue else {
            error("Stack empty")
            stack.append(Item(value: "0"))
            return
        }
        let result = op(v)
        if result.isNaN || result.isInfinite {
            error("Math error")
        } else {
            lastError = nil
        }
        stack.append(Item(value: String(result)))
        shouldAppend = true
    }

    private mutating func push(_ value: Double) {
        if shouldAppend == false && stack.last?.value == "0" {
            stack.removeLast()
        }
        stack.append(Item(value: String(value)))
        shouldAppend = true
    }

    mutating func sqrtPressed()       { buttonPressed(); unaryOp { sqrt($0) } }
    mutating func squarePressed()     { buttonPressed(); unaryOp { $0 * $0 } }
    mutating func cubePressed()       { buttonPressed(); unaryOp { $0 * $0 * $0 } }
    mutating func reciprocalPressed() { buttonPressed(); unaryOp { 1.0 / $0 } }

    mutating func factorialPressed() {
        buttonPressed()
        unaryOp { x in
            guard x >= 0, x.truncatingRemainder(dividingBy: 1) == 0, x <= 170 else { return .nan }
            var r: Double = 1
            var i = Int(x)
            while i > 1 { r *= Double(i); i -= 1 }
            return r
        }
    }

    mutating func sinPressed()  { buttonPressed(); unaryOp { sin(self.toRadians($0)) } }
    mutating func cosPressed()  { buttonPressed(); unaryOp { cos(self.toRadians($0)) } }
    mutating func tanPressed()  { buttonPressed(); unaryOp { tan(self.toRadians($0)) } }
    mutating func sinhPressed() { buttonPressed(); unaryOp { sinh($0) } }
    mutating func coshPressed() { buttonPressed(); unaryOp { cosh($0) } }
    mutating func tanhPressed() { buttonPressed(); unaryOp { tanh($0) } }

    mutating func lnPressed()      { buttonPressed(); unaryOp { log($0) } }
    mutating func log10Pressed()   { buttonPressed(); unaryOp { log10($0) } }
    mutating func expPressed()     { buttonPressed(); unaryOp { Foundation.exp($0) } }
    mutating func tenPowXPressed() { buttonPressed(); unaryOp { pow(10, $0) } }

    /// y^x — pops two: base then exponent (top of stack is exponent).
    mutating func powPressed() {
        buttonPressed()
        guard stack.count > 1,
              let exp = stack.popLast()?.doubleValue,
              let base = stack.popLast()?.doubleValue else {
            error("Stack too small")
            return
        }
        let r = pow(base, exp)
        if r.isNaN || r.isInfinite { error("Math error") } else { lastError = nil }
        stack.append(Item(value: String(r)))
        shouldAppend = true
    }

    mutating func piPressed()     { buttonPressed(); push(.pi) }
    mutating func ePressed()      { buttonPressed(); push(M_E) }
    mutating func randomPressed() { buttonPressed(); push(Double.random(in: 0..<1)) }
}
