//
//  ProgrammerKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ProgrammerKeyboard: View {
    @Binding var calculator: CalculatorProtocol
    
    var body: some View {
        VStack {
            HStack {
                Button("AND", action: { calculator.andPressed() })
                Button("OR",  action: { calculator.orPressed() })
                Button("D",   action: { calculator.hexDigitPressed("D") })
                Button("E",   action: { calculator.hexDigitPressed("E") })
                Button("F",   action: { calculator.hexDigitPressed("F") })
                Button(calculator.cleanStateTitle, action: { calculator.clearPressed() })
            }
            HStack {
                Button("NOR", action: { calculator.norPressed() })
                Button("XOR", action: { calculator.xorPressed() })
                Button("A",   action: { calculator.hexDigitPressed("A") })
                Button("B",   action: { calculator.hexDigitPressed("B") })
                Button("C",   action: { calculator.hexDigitPressed("C") })
                Button(action: { calculator.dropPressed() }) {
                    Image(systemName: "delete.left")
                }
            }
            HStack {
                Button("<<", action: { calculator.leftShiftPressed() })
                Button(">>", action: { calculator.rightShiftPressed() })
                Button("7",  action: { calculator.digitPressed(7) })
                Button("8",  action: { calculator.digitPressed(8) })
                Button("9",  action: { calculator.digitPressed(9) })
                Button("2's", action: { calculator.twosComplementPressed() })
            }
            HStack {
                Button("1's", action: { calculator.onesComplementPressed() })
                Button("FF",  action: { calculator.ffPressed() })
                Button("4",   action: { calculator.digitPressed(4) })
                Button("5",   action: { calculator.digitPressed(5) })
                Button("6",   action: { calculator.digitPressed(6) })
                Button(action: { calculator.dividePressed() }) {
                    Image(systemName: "divide")
                }
                .buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
            HStack {
                Button(action: { calculator.minusPressed() }) {
                    Image(systemName: "minus")
                }
                .buttonStyle(CalculatorButtonStyle(proeminent: true))
                Button("00",  action: { calculator.zeroZeroPressed() })
                Button("1",   action: { calculator.digitPressed(1) })
                Button("2",   action: { calculator.digitPressed(2) })
                Button("3",   action: { calculator.digitPressed(3) })
                Button(action: { calculator.multiplyPressed() }) {
                    Image(systemName: "multiply")
                }
                .buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
            HStack {
                Button(action: { calculator.plusPressed() }) {
                    Image(systemName: "plus")
                }
                .buttonStyle(CalculatorButtonStyle(proeminent: true))
                Button("±",   action: { calculator.invertSignalPressed() })
                Button("0",   action: { calculator.digitPressed(0) })
                Button(".",   action: { calculator.commaPressed() })
                Button("enter", action: { calculator.returnPressed() })
                    .buttonStyle(CalculatorButtonStyle(squared: false, proeminent: true))
            }
        }
        .fixedSize(horizontal: true, vertical: false)
        .buttonStyle(CalculatorButtonStyle())
        .scaledToFit()
    }
}

struct ProgrammerKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammerKeyboard(calculator: Binding.constant(RPN()))
    }
}

