//
//  TouchBar.swift
//  Senolop
//
//  Created by Wallace Silva on 24/04/23.
//

import SwiftUI

struct TouchBar: View {
    @Binding var calculator: Calculator
    
    var body: some View {
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
}

struct TouchBar_Previews: PreviewProvider {
    static var previews: some View {
        TouchBar(calculator: .constant(RPN()))
    }
}
