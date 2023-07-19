//
//  Keyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Keyboard: View {
    @Binding var calculator: Calculator
    
    var body: some View {
        #if os(macOS)
        return NumericKeyboard(calculator: $calculator)
            .touchBar {
                Button {
                    calculator.plusPressed()
                } label: {
                    Image(systemName: "plus")
                }
                Button {
                    calculator.minusPressed()
                } label: {
                    Image(systemName: "minus")
                }
                Button {
                    calculator.multiplyPressed()
                } label: {
                    Image(systemName: "multiply")
                }
                Button {
                    calculator.dividePressed()
                } label: {
                    Image(systemName: "divide")
                }
            }
            .buttonStyle(CalculatorButtonStyle(proeminent: true))
            .keyboardShortcut(.cancelAction)
            .keyboardShortcut(.clear)
            .keyboardShortcut(.defaultAction)
            .keyboardShortcut(.delete)
            .keyboardShortcut(.deleteForward)
            .keyboardShortcut(.downArrow)
            .keyboardShortcut(.end)
            .keyboardShortcut(.escape)
            .keyboardShortcut(.home)
            .keyboardShortcut(.leftArrow)
            .keyboardShortcut(.pageDown)
            .keyboardShortcut(.pageUp)
            .keyboardShortcut(.return)
            .keyboardShortcut(.rightArrow)
            .keyboardShortcut(.space)
            .keyboardShortcut(.tab)
            .keyboardShortcut(.upArrow)
        #else
        return NumericKeyboard(calculator: $calculator)
        #endif
        
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(calculator: Binding.constant(RPN()))
    }
}
