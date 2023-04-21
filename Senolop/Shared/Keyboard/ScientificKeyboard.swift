//
//  ScientificKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ScientificKeyboard: View {
    @Binding var calculator: Calculator
    
    private let spacing: CGFloat = 8
    
    var body: some View {
        HStack {
            VStack(spacing: spacing) {
                HStack {
                    Button("(", action: { })
                        .disabled(true)
                    Button(")", action: { })
                        .disabled(true)
                    Button("mc", action: { })
                    Button("m+", action: { })
                    Button("m-", action: { })
                    Button("mr", action: { })
                }
                HStack {
                    Button("2nd", action: { })
                    Button("x²", action: { })
                    Button("x³", action: { })
                    Button("yˣ", action: { })
                    Button("eˣ", action: { })
                    Button("10ˣ", action: { })
                }
                HStack {
                    Button("¹⁄𝚡", action: { })
                    Button("√x", action: { })
                    Button("∛x", action: { })
                    Button("ˣ√y", action: { })
                    Button("ln", action: { })
                    Button("log₁₀", action: { })
                }
                HStack {
                    Button("x!", action: { })
                    Button("sin", action: { })
                    Button("cos", action: { })
                    Button("tan", action: { })
                    Button("e", action: { })
                    Button("EE", action: { })
                    
                }
                HStack {
                    Button("Rad", action: { })
                    Button("sinh", action: { })
                    Button("cosh", action: { })
                    Button("tanh", action: { })
                    Button("π", action: { })
                    Button("Rand", action: { })
                                    
                }
            }
            NumericKeyboard(calculator: $calculator)
            .scaledToFit()
        }        
        .fixedSize(horizontal: false, vertical: true)
        .buttonStyle(CalculatorButtonStyle(squared: true))
    }
}

struct ScientificKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ScientificKeyboard(calculator: Binding.constant(RPN()))
    }
}
