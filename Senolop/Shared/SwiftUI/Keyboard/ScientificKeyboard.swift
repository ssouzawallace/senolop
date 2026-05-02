//
//  ScientificKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ScientificKeyboard: View {
    @Binding var calculator: CalculatorProtocol
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Button("π",     action: { calculator.piPressed() })
                    Button("e",     action: { calculator.ePressed() })
                    Button("Rand",  action: { calculator.randomPressed() })
                }
                HStack {
                    Button("x²",  action: { calculator.squarePressed() })
                    Button("x³",  action: { calculator.cubePressed() })
                    Button("yˣ",  action: { calculator.powPressed() })
                }
                HStack {
                    Button("¹⁄𝚡", action: { calculator.reciprocalPressed() })
                    Button("√x",  action: { calculator.sqrtPressed() })
                    Button("x!",  action: { calculator.factorialPressed() })
                }
                HStack {
                    Button("ln",     action: { calculator.lnPressed() })
                    Button("log₁₀",  action: { calculator.log10Pressed() })
                    Button("eˣ",     action: { calculator.expPressed() })
                }
                HStack {
                    Button("10ˣ",  action: { calculator.tenPowXPressed() })
                    Button("sin",  action: { calculator.sinPressed() })
                    Button("cos",  action: { calculator.cosPressed() })
                }
                HStack {
                    Button("tan",  action: { calculator.tanPressed() })
                    Button("sinh", action: { calculator.sinhPressed() })
                    Button("cosh", action: { calculator.coshPressed() })
                }
            }
            NumericKeyboard(calculator: $calculator)
            .scaledToFit()
        }
        .buttonStyle(
            CalculatorButtonStyle(
                squared: true
            )
        )
    }
}

struct ScientificKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ScientificKeyboard(calculator: Binding.constant(RPN()))
    }
}

