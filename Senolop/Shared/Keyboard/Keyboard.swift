//
//  Keyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Keyboard: View {
    @Binding var calculator: Calculator
    @Binding var mode: RPN.VisualizationMode
    
    var body: some View {
        switch mode {
        case .basic:
            NumericKeyboard(calculator: $calculator)
        case .scientific:
            ScientificKeyboard(calculator: $calculator)
        case .programmer:
            ProgrammerKeyboard(calculator: $calculator)
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(calculator: Binding.constant(RPN()),
                 mode: .constant(.basic))
        .previewInterfaceOrientation(.landscapeRight)
    }
}
