//
//  Programmer.swift
//  Senolop
//
//  Created by Wallace Silva on 25/10/22.
//

import Foundation

extension RPN {
    /// Convert top stack item to UInt64 (truncating). Used for bitwise ops.
    private func topAsUInt64() -> UInt64? {
        guard let v = stack.last?.doubleValue else { return nil }
        // Allow negative numbers via two's complement bit-pattern.
        if v < 0 {
            let intVal = Int64(v)
            return UInt64(bitPattern: intVal)
        }
        return UInt64(min(v, Double(UInt64.max)))
    }

    private mutating func bitwiseBinary(_ op: (UInt64, UInt64) -> UInt64) {
        guard stack.count > 1 else { error("Stack too small"); return }
        guard let b = stack.popLast()?.doubleValue,
              let a = stack.popLast()?.doubleValue else {
            error("Invalid number"); return
        }
        let ub: UInt64 = b < 0 ? UInt64(bitPattern: Int64(b)) : UInt64(min(b, Double(UInt64.max)))
        let ua: UInt64 = a < 0 ? UInt64(bitPattern: Int64(a)) : UInt64(min(a, Double(UInt64.max)))
        let r = op(ua, ub)
        stack.append(Item(value: String(r)))
        lastError = nil
        shouldAppend = true
    }

    private mutating func bitwiseUnary(_ op: (UInt64) -> UInt64) {
        guard let _ = stack.last?.doubleValue else { error("Stack empty"); return }
        let v = topAsUInt64() ?? 0
        stack.removeLast()
        stack.append(Item(value: String(op(v))))
        lastError = nil
        shouldAppend = true
    }

    mutating func hexDigitPressed(_ digit: String) {
        buttonPressed()
        let upper = digit.uppercased()
        let validHex = Set("0123456789ABCDEF".map { String($0) })
        guard validHex.contains(upper) else { error("Invalid hex"); return }
        // Decode hex digit and treat the in-progress entry as base-16.
        guard let nibble = UInt64(upper, radix: 16) else { return }
        if shouldAppend || (stack.last?.value ?? "") == "0" {
            shouldAppend = false
            if !stack.isEmpty && stack.last?.value == "0" { stack.removeLast() }
            stack.append(Item(value: String(nibble)))
            return
        }
        guard let current = stack.popLast()?.doubleValue else {
            stack.append(Item(value: String(nibble))); return
        }
        let asInt: UInt64 = current < 0 ? UInt64(bitPattern: Int64(current)) : UInt64(current)
        let updated = (asInt &<< 4) | nibble
        stack.append(Item(value: String(updated)))
    }

    mutating func ffPressed() {
        buttonPressed()
        if shouldAppend || stack.last?.value == "0" {
            if !stack.isEmpty && stack.last?.value == "0" { stack.removeLast() }
            stack.append(Item(value: String(0xFF)))
            shouldAppend = false
            return
        }
        guard let current = stack.popLast()?.doubleValue else {
            stack.append(Item(value: String(0xFF))); return
        }
        let asInt: UInt64 = current < 0 ? UInt64(bitPattern: Int64(current)) : UInt64(current)
        stack.append(Item(value: String((asInt &<< 8) | 0xFF)))
    }

    mutating func zeroZeroPressed() {
        buttonPressed()
        digitPressed(0)
        digitPressed(0)
    }

    mutating func andPressed()    { buttonPressed(); bitwiseBinary { $0 & $1 } }
    mutating func orPressed()     { buttonPressed(); bitwiseBinary { $0 | $1 } }
    mutating func xorPressed()    { buttonPressed(); bitwiseBinary { $0 ^ $1 } }
    mutating func norPressed()    { buttonPressed(); bitwiseBinary { ~($0 | $1) } }

    mutating func leftShiftPressed()  { buttonPressed(); bitwiseUnary { $0 &<< 1 } }
    mutating func rightShiftPressed() { buttonPressed(); bitwiseUnary { $0 &>> 1 } }

    mutating func onesComplementPressed() { buttonPressed(); bitwiseUnary { ~$0 } }
    mutating func twosComplementPressed() { buttonPressed(); bitwiseUnary { (~$0) &+ 1 } }
}

