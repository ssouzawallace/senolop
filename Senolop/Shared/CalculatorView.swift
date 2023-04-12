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
        VStack {
            Display(mode: $mode, calculator: $calculator)
                .scaledToFit()
            Keyboard(calculator: $calculator, mode: $mode)
                .scaledToFit()
        }
        .if(UIDevice.current.userInterfaceIdiom == .phone) { view in
            view.fixedSize(horizontal: false, vertical: true)
        }
        .scaledToFit()
        .padding()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(mode: .constant(.basic),
                       calculator: .constant(RPN()))
    }
}
