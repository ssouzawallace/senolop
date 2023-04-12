//
//  BasicKeyboard.swift
//  Senolop
//
//  Created by Wallace Silva on 06/10/22.
//

import SwiftUI

struct BasicKeyboard: View {
    @State var buttonWidth = 0.0
    @Binding var calculator: RPN
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    VStack {
                        CalculatorButton(action: { calculator.swapPressed() }, labelContent: .string("x↔y"))
                        CalculatorButton(action: { calculator.digitPressed(7) }, labelContent: .string("7"))
                        CalculatorButton(action: { calculator.digitPressed(4) }, labelContent: .string("4"))
                        CalculatorButton(action: { calculator.digitPressed(1) }, labelContent: .string("1"))
                    }
                    VStack {
                        CalculatorButton(action: { calculator.rowDownPressed() }, labelContent: .string("R↓"))
                        CalculatorButton(action: { calculator.digitPressed(8) }, labelContent: .string("8"))
                        CalculatorButton(action: { calculator.digitPressed(5) }, labelContent: .string("5"))
                        CalculatorButton(action: { calculator.digitPressed(2) }, labelContent: .string("2"))
                    }
                }
                CalculatorButton(action: { calculator.digitPressed(0) }, labelContent: .string("0"), expandVertically: false, squared: false)
            }
            VStack {
                CalculatorButton(action: { calculator.rowUpPressed() }, labelContent: .string("R↑"))
                CalculatorButton(action: { calculator.digitPressed(9) }, labelContent: .string("9"))
                CalculatorButton(action: { calculator.digitPressed(6) }, labelContent: .string("6"))
                CalculatorButton(action: { calculator.digitPressed(3) }, labelContent: .string("3"))
                CalculatorButton(action: { calculator.returnPressed() }, labelContent: .string("."))
            }
        }
        .padding()
        .scaledToFit()
        
        VStack {
            HStack {
                
                
                
                
                
                
                CalculatorButton(action: { calculator.deletePressed() }, labelContent: .symbol("delete.left"))
            }
            
            HStack {
                CalculatorButton(action: { calculator.acPressed() }, labelContent: .string("AC"))
                CalculatorButton(action: { calculator.cPressed() }, labelContent: .string("C"))
                CalculatorButton(action: { calculator.invertSignalPressed() }, labelContent: .symbol("plusminus"))
                CalculatorButton(action: { calculator.moduloPressed() }, labelContent: .symbol("percent"))
                CalculatorButton(action: { calculator.divisionPressed() }, labelContent: .symbol("divide"))
            }
            
            HStack {
                VStack {
                    HStack {
                        
                        
                        CalculatorButton(action: { calculator.multiplicationPressed() }, labelContent: .symbol("multiply"))
                    }
                    
                    HStack {
                        
                        
                        
                        CalculatorButton(action: { calculator.minusPressed() }, labelContent: .symbol("minus"))
                    }
                    
                    HStack {
                        
                        
                        
                        CalculatorButton(action: { calculator.minusPressed() }, labelContent: .symbol("plus"))
                    }
                    
                    HStack {
                        Spacer()
                        ZStack {
                            Spacer()
                            
                        }
                        
                        CalculatorButton(action: { calculator.returnPressed() }, labelContent: .symbol("return.left"))
                    }
                }
            }
        }
        .padding()
    }
}

struct BasicKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        BasicKeyboard(calculator: Binding.constant(RPN()))
    }
}
