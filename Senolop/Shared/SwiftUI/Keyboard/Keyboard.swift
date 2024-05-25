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
        NumericKeyboard(
            calculator: $calculator
        )
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
