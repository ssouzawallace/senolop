//
//  Keyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Keyboard: View {
    @Binding var calculator: CalculatorProtocol
    
    var body: some View {
        var keyboard: any View {
            switch keyboardMode {
            case .numeric:
                return NumericKeyboard(calculator: $calculator)
            case .programmer:
                return ProgrammerKeyboard(calculator: $calculator)
            case .scientific:
                return ScientificKeyboard(calculator: $calculator)
            default:
                return EmptyView()
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
    }
}
