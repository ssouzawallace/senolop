//
//  Keyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Keyboard: View {
    @Binding var calculator: RPN
    var mode: RPN.VisualizationMode
    
    var body: some View {
        switch mode {
        case .basic:
            BasicKeyboard(calculator: $calculator)
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
                 mode: .programmer)
        .previewInterfaceOrientation(.landscapeRight)
    }
}
