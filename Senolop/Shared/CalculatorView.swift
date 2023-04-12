//
//  CalculatorView.swift
//  Senolop
//
//  Created by Wallace Silva on 07/10/22.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var mode: RPN.VisualizationMode
    @Binding var calculator: RPN
    @Binding var buttonColor: Color

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Display(mode: $mode, calculator: $calculator)
                .padding()
            
            Picker("Mode", selection: $mode) {
                Text(RPN.VisualizationMode.basic.rawValue).tag(RPN.VisualizationMode.basic)
                Text(RPN.VisualizationMode.scientific.rawValue).tag(RPN.VisualizationMode.scientific)
                Text(RPN.VisualizationMode.programmer.rawValue).tag(RPN.VisualizationMode.programmer)
            }
            .pickerStyle(.segmented)
            .padding()
            
            Keyboard(calculator: $calculator, mode: mode)                
                .padding()
        }
        .foregroundColor(buttonColor)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(mode: .constant(.basic), calculator: .constant(RPN()), buttonColor: .constant(.accentColor))
    }
}
