//
//  CalculatorView.swift
//  Senolop
//
//  Created by Wallace Silva on 07/10/22.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var mode: RPNCalculator.VisualizationMode
    @Binding var calculator: RPNCalculator
    @Binding var buttonColor: Color

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Display(mode: $mode, calculator: $calculator)
            Picker("Mode", selection: $mode) {
                Text(RPNCalculator.VisualizationMode.basic.rawValue).tag(RPNCalculator.VisualizationMode.basic)
                Text(RPNCalculator.VisualizationMode.scientific.rawValue).tag(RPNCalculator.VisualizationMode.scientific)
                Text(RPNCalculator.VisualizationMode.programmer.rawValue).tag(RPNCalculator.VisualizationMode.programmer)
            }
            .pickerStyle(.segmented)
            .padding()
            Keyboard(calculator: $calculator, mode: mode)
                .padding()
        }
        .padding()
        .foregroundColor(buttonColor)
        .background(Color("BackgroundColor"))

    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(mode: .constant(.programmer), calculator: .constant(RPNCalculator()), buttonColor: .constant(.accentColor))
    }
}
