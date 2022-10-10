//
//  BasicKeyboard.swift
//  Senolop
//
//  Created by Wallace Silva on 06/10/22.
//

import SwiftUI

struct BasicKeyboard: View {
    @Binding var calculator: RPNCalculator
    
    var body: some View {
        VStack {
            HStack {
                CalculatorButton(action: { calculator.swapPressed() }, labelContent: "x↔y")
                
                CalculatorButton(action: { calculator.rowDownPressed() }, labelContent: "R↓")
                
                CalculatorButton(action: { calculator.rowUpPressed() }, labelContent: "R↑")
                
                CalculatorButton(action: { calculator.deletePressed() }, labelContent: "􁂈")
            }
            
            HStack {
                CalculatorButton(action: { calculator.acPressed() }, labelContent: "AC")
                CalculatorButton(action: { calculator.cPressed() }, labelContent: "C")
                CalculatorButton(action: { calculator.invertSignalPressed() }, labelContent: "􀛺")
                CalculatorButton(action: { calculator.moduloPressed() }, labelContent: "􀘾")
                CalculatorButton(action: { calculator.divisionPressed() }, labelContent: "􀅿")
            }
            
            HStack {
                VStack {
                    HStack {
                        CalculatorButton(action: { calculator.digitPressed(7) }, labelContent: "7")
                        CalculatorButton(action: { calculator.digitPressed(8) }, labelContent: "8")
                        CalculatorButton(action: { calculator.digitPressed(9) }, labelContent: "9")
                        CalculatorButton(action: { calculator.multiplicationPressed() }, labelContent: "􀅾")
                    }
                    
                    HStack {
                        CalculatorButton(action: { calculator.digitPressed(4) }, labelContent: "4")
                        CalculatorButton(action: { calculator.digitPressed(5) }, labelContent: "5")
                        CalculatorButton(action: { calculator.digitPressed(6) }, labelContent: "6")
                        CalculatorButton(action: { calculator.minusPressed() }, labelContent: "􀅽")
                    }
                    
                    HStack {
                        CalculatorButton(action: { calculator.digitPressed(1) }, labelContent: "1")
                        CalculatorButton(action: { calculator.digitPressed(2) }, labelContent: "2")
                        CalculatorButton(action: { calculator.digitPressed(3) }, labelContent: "3")
                        CalculatorButton(action: { calculator.minusPressed() }, labelContent: "􀅼")
                    }
                    
                    HStack {
                        CalculatorButton(action: { calculator.digitPressed(0) }, labelContent: "0")
                        CalculatorButton(action: { calculator.commaPressed() }, labelContent: ".")
                        CalculatorButton(action: { calculator.returnPressed() }, labelContent: "􀅇")
                    }
                }
            }
        }
    }
}

struct BasicKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        BasicKeyboard(calculator: Binding.constant(RPNCalculator()))
    }
}
