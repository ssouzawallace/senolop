//
//  ProgrammerKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ProgrammerKeyboard: View {
    @Binding var calculator: RPN
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    VStack {
                        CalculatorButton(action: { calculator.andPressed() }, labelContent: .string("AND"))
                        CalculatorButton(action: { calculator.norPressed() }, labelContent: .string("NOR"))
                        CalculatorButton(action: { calculator.leftShiftPressed() }, labelContent: .string("<<"))
                        CalculatorButton(action: { calculator.xLeftShiftYPressed() }, labelContent: .string("X<<Y"))
                    }
                    VStack {
                        CalculatorButton(action: { calculator.orPressed() }, labelContent: .string("OR"))
                        CalculatorButton(action: { calculator.xorPressed() }, labelContent: .string("XOR"))
                        CalculatorButton(action: { calculator.rightShiftPressed() }, labelContent: .string(">>"))
                        CalculatorButton(action: { calculator.xRightShiftYPressed() }, labelContent: .string("X>>Y"))
                    }
                }
                CalculatorButton(action: { calculator.invertBytePressed() }, labelContent: .string("INVERTER BYTE"))
                CalculatorButton(action: { calculator.invertWordPressed() }, labelContent: .string("INVERTER PALAVRA"))
            }
            
            NumericProgrammerKeyboard(calculator: $calculator)
            
            VStack {
                HStack {
                    VStack {
                        CalculatorButton(action: { calculator.acPressed() }, labelContent: .string("AC"))
                        CalculatorButton(action: { calculator.rolPressed() }, labelContent: .string("RoL"))
                        CalculatorButton(action: { calculator.buttonPressed()}, labelContent: .string("2's"))
                        CalculatorButton(action: { calculator.divisionPressed() }, labelContent: .symbol("divide"))
                        CalculatorButton(action: { calculator.multiplicationPressed() }, labelContent: .symbol("multiply"))
                    }
                    VStack {
                        CalculatorButton(action: { calculator.cPressed() }, labelContent: .string("C"))
                        CalculatorButton(action: { calculator.rorPressed() }, labelContent: .string("RoR"))
                        CalculatorButton(action: { calculator.buttonPressed() }, labelContent: .string("1's"))
                        CalculatorButton(action: { calculator.minusPressed() }, labelContent: .symbol("minus"))
                        CalculatorButton(action: { calculator.plusPressed() }, labelContent: .symbol("plus"))
                    }
                }
                Button {
                    calculator.returnPressed()
                } label: {
                    CalculatorButton(action: { calculator.returnPressed() }, labelContent: .symbol("return.left"))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct ProgrammerKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammerKeyboard(calculator: Binding.constant(RPN()))
    }
}
