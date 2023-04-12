//
//  Display.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Display: View {
    @Binding var mode: RPN.VisualizationMode
    @State private var baseMode: RPN.BaseMode = .ten
    @State private var multiSelection = Set<UUID>()
    @Binding var calculator: RPN
    
    var body: some View {
        VStack {
            List {
                ForEach(calculator.stack) { element in
                    VStack(alignment: .trailing) {
                        Text("\(Double(element.value))")
                        Divider()
                    }
                }
                .scaleEffect(x: 1, y: -1, anchor: .center)
                .flipsForRightToLeftLayoutDirection(true)
            }
            .scaleEffect(x: 1, y: -1, anchor: .center)
            .listStyle(.plain)
            if mode == .programmer {
                Picker("Mode", selection: $baseMode) {
                    Text("8")
                    Text("10")
                    Text("12")
                }
                .padding()
                .pickerStyle(.segmented)
                BinariesDisplay(value: Int(calculator.stack.last?.value ?? 0))
            }
        }
    }
}

struct Display_Previews: PreviewProvider {
    static var previews: some View {
        Display(mode: Binding.constant(.basic),
                calculator: Binding.constant(RPN()))
    }
}
