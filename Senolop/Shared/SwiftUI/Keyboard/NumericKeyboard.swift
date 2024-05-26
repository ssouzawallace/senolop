//
//  NumericKeyboard.swift
//  Senolop
//
//  Created by Wallace Silva on 27/12/22.
//

import SwiftUI
import SwiftData

struct NumericKeyboard: View {
    @Binding var calculator: CalculatorProtocol
    
    private let spacing: CGFloat = 8
    
    var body: some View {
        VStack(spacing: spacing) {
            HStack {
                Button("7", action: { calculator.digitPressed(7) })
                Button("8", action: { calculator.digitPressed(8) })
                Button("9", action: { calculator.digitPressed(9) })
            }
            HStack {
                Button("4", action: { calculator.digitPressed(4) })
                Button("5", action: { calculator.digitPressed(5) })
                Button("6", action: { calculator.digitPressed(6) })
            }
            HStack {
                Button("1", action: { calculator.digitPressed(1) })
                Button("2", action: { calculator.digitPressed(2) })
                Button("3", action: { calculator.digitPressed(3) })
            }
            HStack {
                Button("0", action: { calculator.digitPressed(0) })
                    .buttonStyle(CalculatorButtonStyle(squared: false))

                Button(".", action: { calculator.commaPressed() })
                    
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
