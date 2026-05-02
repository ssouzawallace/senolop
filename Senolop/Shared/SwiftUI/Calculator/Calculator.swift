//
//  CalculatorView.swift
//  Senolop
//
//  Created by Wallace Silva on 07/10/22.
//

import SwiftUI

struct Calculator: View {
    @Binding var calculator: CalculatorProtocol
    @AppStorage("keyboard_mode_preference") private var storedMode: String = KeyboardMode.numeric.rawValue

    private var mode: KeyboardMode {
        KeyboardMode(rawValue: storedMode) ?? .numeric
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                KeyboardModeSelection()
                Spacer()
            }
            .padding(.vertical, 6)
            Display(calculator: $calculator)
            Keyboard(calculator: $calculator)
                .padding(.horizontal)
                .padding(.bottom, 8)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        Calculator(calculator: .constant(RPN()))
            .environmentObject(StoreManager.preview)
    }
}

protocol CalculatorProtocol {
    var stack: [Item] { get }

    var cleanStateTitle: String { get }

    /// Last user-visible error message, if any. `nil` when no error.
    var lastError: String? { get }

    func buttonPressed()

    mutating func swapPressed()
    mutating func rollDownPressed()
    mutating func rollUpPressed()
    mutating func dropPressed()
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

    // Scientific
    mutating func sqrtPressed()
    mutating func squarePressed()
    mutating func cubePressed()
    mutating func reciprocalPressed()
    mutating func factorialPressed()
    mutating func sinPressed()
    mutating func cosPressed()
    mutating func tanPressed()
    mutating func sinhPressed()
    mutating func coshPressed()
    mutating func tanhPressed()
    mutating func lnPressed()
    mutating func log10Pressed()
    mutating func expPressed()
    mutating func tenPowXPressed()
    mutating func powPressed()
    mutating func piPressed()
    mutating func ePressed()
    mutating func randomPressed()

    // Programmer
    mutating func andPressed()
    mutating func orPressed()
    mutating func xorPressed()
    mutating func norPressed()
    mutating func leftShiftPressed()
    mutating func rightShiftPressed()
    mutating func onesComplementPressed()
    mutating func twosComplementPressed()
    mutating func hexDigitPressed(_ digit: String)
    mutating func ffPressed()
    mutating func zeroZeroPressed()
}

extension CalculatorProtocol {
    func buttonPressed() {
        // default no-op so conformers may opt out
    }
}

