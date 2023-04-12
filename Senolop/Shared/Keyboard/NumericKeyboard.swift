//
//  NumericKeyboard.swift
//  Senolop
//
//  Created by Wallace Silva on 27/12/22.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}

struct NumericKeyboard: View {
    
    @Binding var calculator: Calculator
    
    let spacing: CGFloat = 8
    
    var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            HStack {
                Button(calculator.cleanStateTitle, action: { calculator.clearPressed() })
                    .buttonStyle(MyStyle(special: true))
                Button(action: { calculator.invertSignalPressed() }) {
                    Image(systemName: "plus.forwardslash.minus")
                }
                .buttonStyle(MyStyle(special: true))
                Button(action: { calculator.percentPressed() }) {
                    Image(systemName: "percent")
                }
                .buttonStyle(MyStyle(special: true))
                Button(action: { calculator.dividePressed() }) {
                    Image(systemName: "divide")
                }
                .buttonStyle(MyStyle(proeminent: true))
            }
            HStack {
                Button("7", action: { calculator.digitPressed(7) })
                Button("8", action: { calculator.digitPressed(8) })
                Button("9", action: { calculator.digitPressed(9) })
                Button(action: {calculator.multiplyPressed() }) {
                    Image(systemName: "multiply")
                }
                .buttonStyle(MyStyle(proeminent: true))
            }
            HStack {
                Button("4", action: { calculator.digitPressed(4) })
                Button("5", action: { calculator.digitPressed(5) })
                Button("6", action: { calculator.digitPressed(6) })
                Button(action: { calculator.minusPressed() }) {
                    Image(systemName: "minus")
                }
                .buttonStyle(MyStyle(proeminent: true))
            }
            HStack {
                Button("1", action: { calculator.digitPressed(1) })
                Button("2", action: { calculator.digitPressed(2) })
                Button("3", action: { calculator.digitPressed(3) })
                Button(action: { calculator.plusPressed() }) {
                    Image(systemName: "plus")
                }
                .buttonStyle(MyStyle(proeminent: true))
            }
            HStack {
                Button("0", action: { calculator.digitPressed(0) })
                    .buttonStyle(MyStyle(squared: false))
                    
                HStack {
                    Button(",", action: { calculator.commaPressed() })
                    Button("enter", action: { calculator.returnPressed() })
                    .buttonStyle(MyStyle(proeminent: true))
                }
                
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .buttonStyle(MyStyle())
        .scaledToFit()
    }
}

struct NumericKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        NumericKeyboard(calculator: .constant(RPN()))
    }
}
