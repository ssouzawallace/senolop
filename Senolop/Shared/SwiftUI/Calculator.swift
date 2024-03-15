//
//  CalculatorView.swift
//  Senolop
//
//  Created by Wallace Silva on 07/10/22.
//

import SwiftUI

struct Calculator: View {
    @Binding var calculator: CalculatorProtocol
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(maxHeight: 22)
            
            Display(calculator: $calculator)
            
            Rectangle()
                .frame(maxHeight: 22)
            Keyboard(calculator: $calculator)
                .padding()
            
            Rectangle()
                .frame(maxHeight: 22)
        }
#if os(macOS)
        .touchBar {
            ZStack {
                Button {
                    calculator.plusPressed()
                } label: {
                    Image(systemName: "plus")
                }
                Button {
                    calculator.minusPressed()
                } label: {
                    Image(systemName: "minus")
                }
                Button {
                    calculator.multiplyPressed()
                } label: {
                    Image(systemName: "multiply")
                }
                Button {
                    calculator.dividePressed()
                } label: {
                    Image(systemName: "divide")
                }
            }
        }
#endif
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        Calculator(calculator: .constant(RPN()))
    }
}


struct Item: Identifiable {
    var value: String
    let id = UUID()
}

protocol CalculatorProtocol {
    var stack: [Item] { get }
    
    var cleanStateTitle: String { get }
    
    func buttonPressed()
    
    mutating func swapPressed()
    mutating func rollDownPressed()
    mutating func rollUpPressed()
    mutating func dropPressed()
    mutating func clearPressed()
    mutating func digitPressed(_ digit: UInt8)
    mutating func commaPressed()
    mutating func returnPressed()
    mutating func plusPressed()
    mutating func minusPressed()
    mutating func dividePressed()
    mutating func multiplyPressed()
    mutating func percentPressed()
    mutating func invertSignalPressed()
}

extension CalculatorProtocol {
    func buttonPressed() {
        fatalError()
    }
}

