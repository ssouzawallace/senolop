//
//  NumericProgrammerKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct NumericProgrammerKeyboard: View {
    @Binding var calculator: RPNCalculator
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    calculator.hexDigitPressed("D")
                } label: {
                    ButtonLabel("D")
                }
                Button {
                    calculator.hexDigitPressed("E")
                } label: {
                    ButtonLabel("E")
                }
                Button {
                    calculator.hexDigitPressed("F")
                } label: {
                    ButtonLabel("F")
                }
            }
            HStack {
                Button {
                    calculator.hexDigitPressed("A")
                } label: {
                    ButtonLabel("A")
                }
                Button {
                    calculator.hexDigitPressed("B")
                } label: {
                    ButtonLabel("B")
                }
                Button {
                    calculator.hexDigitPressed("C")
                } label: {
                    ButtonLabel("C")
                }
            }
            HStack {
                Button {
                    calculator.digitPressed(7)
                } label: {
                    ButtonLabel("7")
                }
                Button {
                    calculator.digitPressed(8)
                } label: {
                    ButtonLabel("8")
                }
                Button {
                    calculator.digitPressed(9)
                } label: {
                    ButtonLabel("9")
                }
            }
            HStack {
                Button {
                    calculator.digitPressed(4)
                } label: {
                    ButtonLabel("4")
                }
                Button {
                    calculator.digitPressed(5)
                } label: {
                    ButtonLabel("5")
                }
                Button {
                    calculator.digitPressed(6)
                } label: {
                    ButtonLabel("6")
                }
            }
            HStack {
                Button {
                    calculator.digitPressed(1)
                } label: {
                    ButtonLabel("1")
                }
                Button {
                    calculator.digitPressed(2)
                } label: {
                    ButtonLabel("2")
                }
                Button {
                    calculator.digitPressed(3)
                } label: {
                    ButtonLabel("3")
                }
            }
            HStack {
                Button {
                    calculator.ffPressed()
                } label: {
                    ButtonLabel("FF")
                }
                Button {
                    calculator.digitPressed(0)
                } label: {
                    ButtonLabel("0")
                }
                Button {
                    calculator.zeroZeroPressed()
                } label: {
                    ButtonLabel("00")
                }
            }
        }
        .fixedSize(horizontal: true, vertical: true)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct NumericProgrammerKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        NumericProgrammerKeyboard(calculator: Binding.constant(RPNCalculator()))
    }
}
