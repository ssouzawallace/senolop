//
//  Display.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Display: View {
    @Binding var mode: RPNCalculator.VisualizationMode
    @State private var baseMode: RPNCalculator.BaseMode = .ten
    @State private var multiSelection = Set<UUID>()
    @Binding var calculator: RPNCalculator
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(calculator.stack) { element in
                    VStack(alignment: .trailing) {
                        Text("\(Double(element.value))")
                        Divider()
                    }
                }
            }
            if mode == .programmer {
                Picker("Mode", selection: $baseMode) {
                    Text("8")
                    Text("10")
                    Text("12")
                }
                BinariesDisplay(value: Int(calculator.stack.last?.value ?? 0))
            }
        }
    }
}

struct Display_Previews: PreviewProvider {
    static var previews: some View {
        Display(mode: Binding.constant(.basic),
                calculator: Binding.constant(RPNCalculator()))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
