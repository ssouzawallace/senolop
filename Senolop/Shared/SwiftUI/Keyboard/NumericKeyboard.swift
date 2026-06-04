//
//  NumericKeyboard.swift
//  Senolop
//
//  Created by Wallace Silva on 27/12/22.
//

import SwiftUI

struct NumericKeyboard: View {
    @Binding var calculator: CalculatorProtocol
    
    private let spacing: CGFloat = 8
    
    var body: some View {
        VStack(spacing: spacing) {
            HStack(spacing: spacing) {
                Button(calculator.cleanStateTitle, action: { calculator.clearPressed() })
                    .buttonStyle(CalculatorButtonStyle(special: true))
                Button(action: { calculator.swapPressed() }) {
                    Image(systemName: "arrow.left.arrow.right")
                }.buttonStyle(CalculatorButtonStyle(special: true))
                Button("±", action: { calculator.invertSignalPressed() })
                    .buttonStyle(CalculatorButtonStyle(special: true))
                Button(action: { calculator.dividePressed() }) {
                    Image(systemName: "divide")
                }.buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
            HStack(spacing: spacing) {
                Button("7", action: { calculator.digitPressed(7) })
                Button("8", action: { calculator.digitPressed(8) })
                Button("9", action: { calculator.digitPressed(9) })
                Button(action: { calculator.multiplyPressed() }) {
                    Image(systemName: "multiply")
                }.buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
            HStack(spacing: spacing) {
                Button("4", action: { calculator.digitPressed(4) })
                Button("5", action: { calculator.digitPressed(5) })
                Button("6", action: { calculator.digitPressed(6) })
                Button(action: { calculator.minusPressed() }) {
                    Image(systemName: "minus")
                }.buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
            HStack(spacing: spacing) {
                Button("1", action: { calculator.digitPressed(1) })
                Button("2", action: { calculator.digitPressed(2) })
                Button("3", action: { calculator.digitPressed(3) })
                Button(action: { calculator.plusPressed() }) {
                    Image(systemName: "plus")
                }.buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
            HStack(spacing: spacing) {
                Button("0", action: { calculator.digitPressed(0) })
                Button(".", action: { calculator.commaPressed() })
                Button("%", action: { calculator.percentPressed() })
                Button(action: { calculator.returnPressed() }) {
                    Image(systemName: "return")
                }.buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
        }
        .buttonStyle(CalculatorButtonStyle(squared: true))
    }
}

struct NumericKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        NumericKeyboard(calculator: .constant(RPN()))
    }
}

