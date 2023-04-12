//
//  ScientificKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ScientificKeyboard: View {
    @Binding var calculator: RPN
    
    var body: some View {
        HStack {
            VStack {
                CalculatorButton(action: { calculator.buttonPressed() }, labelContent:.string( "("))
                CalculatorButton(action: { calculator.lessFunctionsPressed() }, labelContent: .string("2nd"))
                CalculatorButton(action: { calculator.buttonPressed() }, labelContent: .string("?"))
                CalculatorButton(action: { calculator.inversePressed() }, labelContent: .string("1/2"))
                CalculatorButton(action: { calculator.xFactorialPressed() }, labelContent: .string("x!"))
                                
                if calculator.mode == .deg {
                    CalculatorButton(action: { calculator.radPressed() }, labelContent: .string("Rad"))
                }
                CalculatorButton(action: { calculator.degPressed() }, labelContent: .string("Deg"))
            }
            
            VStack {
                CalculatorButton(action: { calculator.buttonPressed() }, labelContent: .string(")"))
                CalculatorButton(action: { calculator.x2Pressed() }, labelContent: .string("x^2"))
                CalculatorButton(action: { calculator.sqrtPressed() }, labelContent: .string("sqrt(x)"))
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.sinInvPressed() }, labelContent: .string("sin⁻¹"))
                    CalculatorButton(action: { calculator.sinhInvPressed() }, labelContent: .string("sinh⁻¹"))
                } else {
                    CalculatorButton(action: { calculator.sinPressed() }, labelContent: .string("sin"))
                    CalculatorButton(action: { calculator.sinhPressed() }, labelContent: .string("sinh"))
                }
            }
            
            VStack {
                CalculatorButton(action: { calculator.mcPressed() }, labelContent: .string("MC"))
                CalculatorButton(action: { calculator.x3Pressed() }, labelContent: .string("x^3"))
                CalculatorButton(action: { calculator.sqrt3Pressed() }, labelContent: .string("sqrt(x, 3)"))
                
                
                
                CalculatorButton(action: { calculator.sinhPressed() }, labelContent: .string("sin"))
                CalculatorButton(action: { calculator.sinhPressed() }, labelContent: .string("sinh"))
                
                
                
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.cosInvPressed() }, labelContent: .string("cos⁻¹"))
                    CalculatorButton(action: { calculator.coshInvPressed() }, labelContent: .string("cosh⁻¹"))
                } else {
                    CalculatorButton(action: { calculator.cosPressed() }, labelContent: .string("cos"))
                    CalculatorButton(action: { calculator.coshPressed() }, labelContent: .string("cosh"))
                }
            }
            
            VStack {
                CalculatorButton(action: { calculator.mPlusPressed() }, labelContent: .string("M+"))
                CalculatorButton(action: { calculator.yxPressed() }, labelContent: .string("y^x"))
                CalculatorButton(action: { calculator.sqrtyxPressed() }, labelContent: .string("sqrt(y, x)"))
                
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.tanInvPressed() }, labelContent: .string("tan⁻¹"))
                    CalculatorButton(action: { calculator.tanhInvPressed() }, labelContent: .string("tanh⁻¹"))
                } else {
                    CalculatorButton(action: { calculator.tanPressed() }, labelContent: .string("tan"))
                    CalculatorButton(action: { calculator.tanhPressed() }, labelContent: .string("tanh"))
                }
            }
            
            VStack {
                CalculatorButton(action: { calculator.mMinusPressed() }, labelContent: .string("tan"))
                CalculatorButton(action: { calculator.xPoweredByYPressed() }, labelContent: .string("x^y"))
                CalculatorButton(action: { calculator.ePoweredByXPressed() }, labelContent: .string("e^x"))
                
                
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.lnyPressed() }, labelContent: .string("lny"))
                } else {
                    CalculatorButton(action: { calculator.lognPressed() }, labelContent: .string("ln"))
                }
                
                CalculatorButton(action: { calculator.ePressed() }, labelContent: .string("e"))
                CalculatorButton(action: { calculator.piPressed() }, labelContent: .string("π"))
            }
            
            VStack {
                CalculatorButton(action: { calculator.mrPressed() }, labelContent: .string("MR"))
                CalculatorButton(action: { calculator.twoPoweredByXPressed() }, labelContent: .string("2ˆx"))
                CalculatorButton(action: { calculator.tenPoweredByXPressed() }, labelContent: .string("10^x"))
                CalculatorButton(action: { calculator.piPressed() }, labelContent: .string("π"))
                
                if calculator.moreFunctions {
                    CalculatorButton(action: { calculator.log2Pressed() }, labelContent: .string("log2"))
                } else {
                    CalculatorButton(action: { calculator.log10Pressed() }, labelContent: .string("log10"))
                }
                                
                CalculatorButton(action: { calculator.eePressed() }, labelContent: .string("EE"))
                CalculatorButton(action: { calculator.randPressed() }, labelContent: .string("Rand"))
            }
        }
        .fixedSize(horizontal: true, vertical: true)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct ScientificKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ScientificKeyboard(calculator: Binding.constant(RPN()))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
