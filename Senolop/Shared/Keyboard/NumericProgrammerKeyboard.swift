//
//  NumericProgrammerKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct NumericProgrammerKeyboard: View {
    @Binding var calculator: RPN
    
    var body: some View {
        VStack {
            HStack {
                CalculatorButton(action: { calculator.hexDigitPressed("D") }, labelContent: .string("D"))
                CalculatorButton(action: { calculator.hexDigitPressed("E") }, labelContent: .string("E"))
                CalculatorButton(action: { calculator.hexDigitPressed("F") }, labelContent: .string("F"))
            }
            
            HStack {
                CalculatorButton(action: { calculator.hexDigitPressed("A") }, labelContent: .string("A"))
                CalculatorButton(action: { calculator.hexDigitPressed("B") }, labelContent: .string("B"))
                CalculatorButton(action: { calculator.hexDigitPressed("C") }, labelContent: .string("C"))
            }
            
            HStack {
                CalculatorButton(action: { calculator.digitPressed(7) }, labelContent: .string("7"))
                CalculatorButton(action: { calculator.digitPressed(8) }, labelContent: .string("8"))
                CalculatorButton(action: { calculator.digitPressed(9) }, labelContent: .string("9"))
            }
            
            HStack {
                CalculatorButton(action: { calculator.digitPressed(4) }, labelContent: .string("4"))
                CalculatorButton(action: { calculator.digitPressed(5) }, labelContent: .string("5"))
                CalculatorButton(action: { calculator.digitPressed(6) }, labelContent: .string("6"))
            }
            
            HStack {
                CalculatorButton(action: { calculator.digitPressed(1) }, labelContent: .string("1"))
                CalculatorButton(action: { calculator.digitPressed(2) }, labelContent: .string("2"))
                CalculatorButton(action: { calculator.digitPressed(3) }, labelContent: .string("3"))
            }
            
            HStack {
                CalculatorButton(action: { calculator.ffPressed() }, labelContent: .string("FF"))
                CalculatorButton(action: { calculator.digitPressed(0) }, labelContent: .string("0"))
                CalculatorButton(action: { calculator.zeroZeroPressed() }, labelContent: .string("00"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct NumericProgrammerKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        NumericProgrammerKeyboard(calculator: Binding.constant(RPN()))
    }
}
