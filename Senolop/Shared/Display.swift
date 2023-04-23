//
//  Display.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Display: View {
    @State private var multiSelection = Set<UUID>()
    @Binding var calculator: Calculator
    
    var body: some View {
        List(calculator.stack.reversed()) { element in
            VStack {
                HStack {
                    Spacer()
                    Text("\(Double(element.value))".replacingOccurrences(of: ".", with: ","))
                        .font(.largeTitle)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .scaleEffect(x: 1, y: -1, anchor: .center)
                }
                Divider()
                    .background(.secondary)
            }            
        }
        .scaleEffect(x: 1, y: -1, anchor: .center)
        .flipsForRightToLeftLayoutDirection(true)
        .listStyle(.plain)
    }
}

struct Display_Previews: PreviewProvider {
    static var previews: some View {
        Display(calculator: .constant(RPN()))
    }
}
