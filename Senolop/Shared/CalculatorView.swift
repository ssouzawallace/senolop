//
//  CalculatorView.swift
//  Senolop
//
//  Created by Wallace Silva on 07/10/22.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var mode: RPN.VisualizationMode
    @Binding var calculator: Calculator

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Display(mode: $mode, calculator: $calculator)
                .scaledToFit()
            Keyboard(calculator: $calculator, mode: $mode)
                .scaledToFill()
        }
        .scaledToFill()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(mode: .constant(.scientific),
                       calculator: .constant(RPN()))
    }
}
