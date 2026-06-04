//
//  Keyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Keyboard: View {
    @Binding var calculator: CalculatorProtocol
    @AppStorage("keyboard_mode_preference") private var storedMode: String = KeyboardMode.numeric.rawValue
    @EnvironmentObject private var store: StoreManager

    private var mode: KeyboardMode {
        let m = KeyboardMode(rawValue: storedMode) ?? .numeric
        // Force fallback to numeric if user lost their entitlement
        if m.requiresPro && !store.isUnlocked { return .numeric }
        return m
    }

    var body: some View {
        Group {
            switch mode {
            case .numeric:
                NumericKeyboard(calculator: $calculator)
            case .scientific:
                ScientificKeyboard(calculator: $calculator)
            case .programmer:
                ProgrammerKeyboard(calculator: $calculator)
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(
            calculator: Binding.constant(
                RPN()
            )
        )
        .environmentObject(StoreManager.preview)
    }
}

