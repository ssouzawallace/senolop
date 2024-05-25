//
//  CalculatorView.swift
//  Senolop
//
//  Created by Wallace Silva on 07/10/22.
//

import SwiftUI

enum KeyboardType {
    case scientific
    case numeric
    case programmer
    case none
}

var keyboardType: KeyboardType = .scientific

struct Calculator: View {
    @Binding var calculator: CalculatorProtocol
    
    var keyboard: any View {
        switch keyboardMode {
        case .numeric:
            return NumericKeyboard(calculator: $calculator)
        case .programmer:
            return ProgrammerKeyboard(calculator: $calculator)
        case .scientific:
            return ScientificKeyboard(calculator: $calculator)
        default:
            return EmptyView()
        }
    }
    
    var body: some View {
        VStack {
            Display(
                calculator: $calculator
            )
            Keyboard(
                calculator: $calculator
            )
        }
    }
    
    var display: any View {
        Display(
            calculator: $calculator
        )
    }
    
    var body: some View {
        display
        keyboard
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
