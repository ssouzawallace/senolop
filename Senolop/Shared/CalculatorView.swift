//
//  CalculatorView.swift
//  Senolop
//
//  Created by Wallace Silva on 07/10/22.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var calculator: Calculator
    
    var body: some View {
        VStack {
            Display(calculator: $calculator)
            Keyboard(calculator: $calculator)
                .padding()
        }
        .touchBar {
            ZStack {
                Button {
                    calculator.plusPressed()
                } label: {
                    Image(systemName: "plus")
                }
                Button {
                    calculator.minusPressed()
                } label: {
                    Image(systemName: "minus")
                }
                Button {
                    calculator.multiplyPressed()
                } label: {
                    Image(systemName: "multiply")
                }
                Button {
                    calculator.dividePressed()
                } label: {
                    Image(systemName: "divide")
                }
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(calculator: .constant(RPN()))
    }
}
