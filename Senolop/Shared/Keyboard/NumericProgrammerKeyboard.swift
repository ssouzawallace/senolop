//
//  NumericProgrammerKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct NumericProgrammerKeyboard: View {
    @Binding var calculator: RPNCalculator
    
    var body: some View {
        VStack {
            HStack {
                CalculatorButton(action: { calculator.hexDigitPressed("D") }, labelContent: "D")
                CalculatorButton(action: { calculator.hexDigitPressed("E") }, labelContent: "E")
                CalculatorButton(action: { calculator.hexDigitPressed("F") }, labelContent: "F")
            }
            
            HStack {
                CalculatorButton(action: { calculator.hexDigitPressed("A") }, labelContent: "A")
                CalculatorButton(action: { calculator.hexDigitPressed("B") }, labelContent: "B")
                CalculatorButton(action: { calculator.hexDigitPressed("C") }, labelContent: "C")
            }
            
            HStack {
                CalculatorButton(action: { calculator.digitPressed(7) }, labelContent: "7")
                CalculatorButton(action: { calculator.digitPressed(8) }, labelContent: "8")
                CalculatorButton(action: { calculator.digitPressed(9) }, labelContent: "9")
            }
            
            HStack {
                CalculatorButton(action: { calculator.digitPressed(4) }, labelContent: "4")
                CalculatorButton(action: { calculator.digitPressed(5) }, labelContent: "5")
                CalculatorButton(action: { calculator.digitPressed(6) }, labelContent: "6")
            }
            
            HStack {
                CalculatorButton(action: { calculator.digitPressed(1) }, labelContent: "1")
                CalculatorButton(action: { calculator.digitPressed(2) }, labelContent: "2")
                CalculatorButton(action: { calculator.digitPressed(3) }, labelContent: "3")
            }
            
            HStack {
                CalculatorButton(action: { calculator.ffPressed() }, labelContent: "FF")
                CalculatorButton(action: { calculator.digitPressed(0) }, labelContent: "0")
                CalculatorButton(action: { calculator.zeroZeroPressed() }, labelContent: "00")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct NumericProgrammerKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        NumericProgrammerKeyboard(calculator: Binding.constant(RPNCalculator()))
    }
}
