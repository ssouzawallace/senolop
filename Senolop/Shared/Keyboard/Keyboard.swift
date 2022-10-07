//
//  Keyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Keyboard: View {
    @Binding var calculator: RPNCalculator
    @State var mode = RPNCalculator.VisualizationMode.basic
    
    var body: some View {
        switch mode {
        case .programmer:
            ProgrammerKeyboard(calculator: $calculator)
        case .basic:
            BasicKeyboard(calculator: $calculator)
        case .scientific:
            ScientificKeyboard(calculator: $calculator)
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(calculator: Binding.constant(RPNCalculator()))
    }
}