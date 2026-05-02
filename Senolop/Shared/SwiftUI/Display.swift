//
//  Display.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Display: View {
    @Binding var calculator: CalculatorProtocol
    @AppStorage("decimal_precision_preference") private var precision: Int = 10

    var body: some View {
        VStack(spacing: 0) {
            if let err = calculator.lastError {
                HStack {
                    Spacer()
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text(err)
                        .font(.caption)
                }
                .foregroundColor(.red)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .accessibilityIdentifier("calculator.error")
            }
            List(calculator.stack.reversed()) { element in
                VStack {
                    HStack {
                        Spacer()
                        Text(element.display(precision: precision))
                            .font(.largeTitle)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .scaleEffect(x: 1, y: -1, anchor: .center)
                            .accessibilityIdentifier("display.value")
                    }
                    Divider()
                }
            }
            .scaleEffect(x: 1, y: -1, anchor: .center)
            .flipsForRightToLeftLayoutDirection(true)
            .listStyle(.plain)
        }
    }
}

struct Display_Previews: PreviewProvider {
    static var previews: some View {
        Display(calculator: .constant(RPN()))
    }
}

