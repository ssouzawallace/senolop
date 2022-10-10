//
//  ProgrammerKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ProgrammerKeyboard: View {
    @Binding var calculator: RPNCalculator
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    VStack {
                        CalculatorButton(action: { calculator.andPressed() }, labelContent: "AND")
                        CalculatorButton(action: { calculator.norPressed() }, labelContent: "NOR")
                        CalculatorButton(action: { calculator.leftShiftPressed() }, labelContent: "<<")
                        CalculatorButton(action: { calculator.xLeftShiftYPressed() }, labelContent: "X<<Y")
                    }
                    VStack {
                        CalculatorButton(action: { calculator.orPressed() }, labelContent: "OR")
                        CalculatorButton(action: { calculator.xorPressed() }, labelContent: "XOR")
                        CalculatorButton(action: { calculator.rightShiftPressed() }, labelContent: ">>")
                        CalculatorButton(action: { calculator.xRightShiftYPressed() }, labelContent: "X>>Y")
                    }
                }
                CalculatorButton(action: { calculator.invertBytePressed() }, labelContent: "INVERTER BYTE")
                CalculatorButton(action: { calculator.invertWordPressed() }, labelContent: "INVERTER PALAVRA")
            }
            
            NumericProgrammerKeyboard(calculator: $calculator)
            
            VStack {
                HStack {
                    VStack {
                        CalculatorButton(action: { calculator.acPressed() }, labelContent: "AC")
                        CalculatorButton(action: { calculator.rolPressed() }, labelContent: "RoL")
                        CalculatorButton(action: { calculator.buttonPressed()}, labelContent: "2's")
                        CalculatorButton(action: { calculator.divisionPressed() }, labelContent: "􀅿")
                        CalculatorButton(action: { calculator.multiplicationPressed() }, labelContent: "􀅾")
                    }
                    VStack {
                        CalculatorButton(action: { calculator.cPressed() }, labelContent: "C")
                        CalculatorButton(action: { calculator.rorPressed() }, labelContent: "RoR")
                        CalculatorButton(action: { calculator.buttonPressed() }, labelContent: "1's")
                        CalculatorButton(action: { calculator.minusPressed() }, labelContent: "􀅽")
                        CalculatorButton(action: { calculator.plusPressed() }, labelContent: "􀅼")
                    }
                }
                Button {
                    calculator.returnPressed()
                } label: {
                    CalculatorButton(action: { calculator.returnPressed() }, labelContent: "􀅇")
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
        ProgrammerKeyboard(calculator: Binding.constant(RPNCalculator()))
    }
}
