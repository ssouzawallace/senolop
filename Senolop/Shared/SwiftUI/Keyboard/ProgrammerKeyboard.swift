//
//  ProgrammerKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ProgrammerKeyboard: View {
    @Binding var calculator: Calculator
    
    var body: some View {
        VStack {
            HStack {
                Button("AND", action: { })
                Button("OR", action: { })
                Button("D", action: { })
                Button("E", action: { })
                Button("F", action: { })
                Button("AC", action: { })
                Button("C", action: { })
            }
            HStack {
                Button("NOR", action: { })
                Button("XOR", action: { })
                Button("A", action: { })
                Button("B", action: { })
                Button("C", action: { })
                Button("RoL", action: { })
                Button("RoR", action: { })
            }
            HStack {
                Button("<<", action: { })
                Button(">>", action: { })
                Button("7", action: { calculator.digitPressed(7) })
                Button("8", action: { calculator.digitPressed(8) })
                Button("9", action: { calculator.digitPressed(9) })
                Button("2's", action: { })
                Button("1's", action: { })
            }
            HStack {
                Button("X<<Y", action: { })
                Button("X>>Y", action: { })
                Button("4", action: { calculator.digitPressed(4) })
                Button("5", action: { calculator.digitPressed(5) })
                Button("6", action: { calculator.digitPressed(6) })
                Button(action: { calculator.dividePressed() }) {
                    Image(systemName: "divide")
                }
                .buttonStyle(CalculatorButtonStyle(proeminent: true))
                Button(action: { calculator.minusPressed() }) {
                    Image(systemName: "minus")
                }
                .buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
            HStack {
                Button("byte flip", action: { })
                    .buttonStyle(CalculatorButtonStyle(squared: false))
                Button("1", action: { calculator.digitPressed(1) })
                Button("2", action: { calculator.digitPressed(2) })
                Button("3", action: { calculator.digitPressed(3) })
                Button(action: { calculator.multiplyPressed() }) {
                    Image(systemName: "multiply")
                }
                .buttonStyle(CalculatorButtonStyle(proeminent: true))
                Button(action: { calculator.plusPressed() }) {
                    Image(systemName: "plus")
                }
                .buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
            HStack {
                Button("word flip", action: { })
                    .buttonStyle(CalculatorButtonStyle(squared: false))
                
                Button("FF", action: { })
                
                Button("0", action: { calculator.digitPressed(0) })
                
                Button("00", action: {  })
                    
                Button("enter", action: { calculator.returnPressed() })
                    .buttonStyle(CalculatorButtonStyle(squared: false, proeminent: true))
                
            }
        }
        .fixedSize(horizontal: true, vertical: false)
        .buttonStyle(CalculatorButtonStyle())
        .scaledToFit()
    }
}

struct ProgrammerKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammerKeyboard(calculator: Binding.constant(RPN()))
    }
}
