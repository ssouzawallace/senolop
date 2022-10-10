//
//  ScientificKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ScientificKeyboard: View {
    @Binding var calculator: RPNCalculator
    
    var body: some View {
        HStack {
            VStack {
                CalculatorButton(action: { calculator.buttonPressed() }, labelContent: "(")
                CalculatorButton(action: { calculator.lessFunctionsPressed() }, labelContent: "2nd")
                CalculatorButton(action: { calculator.moreFunctions }, labelContent: "?")
                CalculatorButton(action: { calculator.inversePressed() }, labelContent: "1/2")
                CalculatorButton(action: { calculator.xFactorialPressed() }, labelContent: "x!")
                                
                if calculator.mode == .deg {
                    CalculatorButton(action: { calculator.radPressed() }, labelContent: "Rad")
                }
                CalculatorButton(action: { calculator.degPressed() }, labelContent: "Deg")
            }
            
            VStack {
                CalculatorButton(action: { calculator.buttonPressed() }, labelContent: ")")
                CalculatorButton(action: { calculator.x2Pressed() }, labelContent: "x^2")
                CalculatorButton(action: { calculator.sqrtPressed() }, labelContent: "sqrt(x)")
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.sinInvPressed() }, labelContent: "sin⁻¹")
                    CalculatorButton(action: { calculator.sinhInvPressed() }, labelContent: "sinh⁻¹")
                } else {
                    CalculatorButton(action: { calculator.sinPressed() }, labelContent: "sin")
                    CalculatorButton(action: { calculator.sinhPressed() }, labelContent: "sinh")
                }
            }
            
            VStack {
                CalculatorButton(action: { calculator.mcPressed() }, labelContent: "MC")
                CalculatorButton(action: { calculator.x3Pressed() }, labelContent: "x^3")
                CalculatorButton(action: { calculator.sqrt3Pressed() }, labelContent: "sqrt(x, 3)")
                
                
                
                CalculatorButton(action: { calculator.sinhPressed() }, labelContent: "sinh")
                CalculatorButton(action: { calculator.sinhPressed() }, labelContent: "sinh")
                
                
                
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.cosInvPressed() }, labelContent: "cos⁻¹")
                    CalculatorButton(action: { calculator.coshInvPressed() }, labelContent: "cosh⁻¹")
                } else {
                    CalculatorButton(action: { calculator.cosPressed() }, labelContent: "cos")
                    CalculatorButton(action: { calculator.coshPressed() }, labelContent: "cosh")
                }
            }
            
            VStack {
                CalculatorButton(action: { calculator.mPlusPressed() }, labelContent: "M+")
                CalculatorButton(action: { calculator.yxPressed() }, labelContent: "y^x")
                CalculatorButton(action: { calculator.sqrtyxPressed() }, labelContent: "sqrt(y, x)")
                
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.tanInvPressed() }, labelContent: "tan⁻¹")
                    CalculatorButton(action: { calculator.tanhInvPressed() }, labelContent: "tanh⁻¹")
                } else {
                    CalculatorButton(action: { calculator.tanPressed() }, labelContent: "tan")
                    CalculatorButton(action: { calculator.tanhPressed() }, labelContent: "tanh")
                }
            }
            
            VStack {
                CalculatorButton(action: { calculator.mMinusPressed() }, labelContent: "tan")
                CalculatorButton(action: { calculator.xPoweredByYPressed() }, labelContent: "x^y")
                CalculatorButton(action: { calculator.ePoweredByXPressed() }, labelContent: "e^x")
                
                
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.lnyPressed() }, labelContent: "lny")
                } else {
                    CalculatorButton(action: { calculator.lognPressed() }, labelContent: "ln")
                }
                
                CalculatorButton(action: { calculator.ePressed() }, labelContent: "e")
                CalculatorButton(action: { calculator.piPressed() }, labelContent: "π")
            }
            
            VStack {
                CalculatorButton(action: { calculator.mrPressed() }, labelContent: "MR")
                CalculatorButton(action: { calculator.twoPoweredByXPressed() }, labelContent: "2ˆx")
                CalculatorButton(action: { calculator.tenPoweredByXPressed() }, labelContent: "10^x")
                CalculatorButton(action: { calculator.piPressed() }, labelContent: "π")
                
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.log2Pressed() }, labelContent: "log2")
                } else {
                    CalculatorButton(action: { calculator.log10Pressed() }, labelContent: "log10")
                }
                                
                CalculatorButton(action: { calculator.eePressed() }, labelContent: "EE")
                CalculatorButton(action: { calculator.randPressed() }, labelContent: "Rand")
            }
        }
        .fixedSize(horizontal: true, vertical: true)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct ScientificKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ScientificKeyboard(calculator: Binding.constant(RPNCalculator()))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
