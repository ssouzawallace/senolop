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
                    Text("D")
                }
                Button {
                    calculator.hexDigitPressed("E")
                } label: {
                    Text("E")
                }
                Button {
                    calculator.hexDigitPressed("F")
                } label: {
                    Text("F")
                }
            }
            HStack {
                Button {
                    calculator.hexDigitPressed("A")
                } label: {
                    Text("A")
                }
                Button {
                    calculator.hexDigitPressed("B")
                } label: {
                    Text("B")
                }
                Button {
                    calculator.hexDigitPressed("C")
                } label: {
                    Text("C")
                }
            }
            HStack {
                Button {
                    calculator.digitPressed(7)
                } label: {
                    Text("7")
                }
                Button {
                    calculator.digitPressed(8)
                } label: {
                    Text("8")
                }
                Button {
                    calculator.digitPressed(9)
                } label: {
                    Text("9")
                }
            }
            HStack {
                Button {
                    calculator.digitPressed(4)
                } label: {
                    Text("4")
                }
                Button {
                    calculator.digitPressed(5)
                } label: {
                    Text("5")
                }
                Button {
                    calculator.digitPressed(6)
                } label: {
                    Text("6")
                }
            }
            HStack {
                Button {
                    calculator.digitPressed(1)
                } label: {
                    Text("1")
                }
                Button {
                    calculator.digitPressed(2)
                } label: {
                    Text("2")
                }
                Button {
                    calculator.digitPressed(3)
                } label: {
                    Text("3")
                }
            }
            HStack {
                Button {
                    calculator.ffPressed()
                } label: {
                    Text("FF")
                }
                Button {
                    calculator.digitPressed(0)
                } label: {
                    Text("0")
                }
                Button {
                    calculator.zeroZeroPressed()
                } label: {
                    Text("00")
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
