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
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(calculator: .constant(RPN()))
    }
}
