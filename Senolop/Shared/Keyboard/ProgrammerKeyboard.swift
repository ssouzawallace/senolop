//
//  ProgrammerKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ProgrammerKeyboard: View {
    @Binding var calculator: RPNCalculator
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    VStack {
                        Button {
                            calculator.andPressed()
                        } label: {
                            ButtonLabel("AND")
                        }
                        Button {
                            calculator.norPressed()
                        } label: {
                            ButtonLabel("NOR")
                        }
                        Button {
                            calculator.leftShiftPressed()
                        } label: {
                            ButtonLabel("<<")
                        }
                        Button {
                            calculator.xLeftShiftYPressed()
                        } label: {
                            ButtonLabel("X<<Y")
                        }
                    }
                    VStack {
                        Button {
                            calculator.orPressed()
                        } label: {
                            ButtonLabel("OR")
                        }
                        Button {
                            calculator.xorPressed()
                        } label: {
                            ButtonLabel("XOR")
                        }
                        Button {
                            calculator.rightShiftPressed()
                        } label: {
                            ButtonLabel(">>")
                        }
                        Button {
                            calculator.xRightShiftYPressed()
                        } label: {
                            ButtonLabel("X>>Y")
                        }
                    }
                }
                Button {
                    calculator.invertBytePressed()
                } label: {
                    ButtonLabel("inverter byte")
                }
                Button {
                    calculator.invertWordPressed()
                } label: {
                    ButtonLabel("inverter palavra")
                }
            }
            
            NumericProgrammerKeyboard(calculator: $calculator)
            
            VStack {
                HStack {
                    VStack {
                        Button {
                            calculator.acPressed()
                        } label: {
                            ButtonLabel("AC")
                        }
                        Button {
                            calculator.rolPressed()
                        } label: {
                            ButtonLabel("RoL")
                        }
                        Button {
                            
                        } label: {
                            ButtonLabel("2´s")
                        }
                        .disabled(true)
                        Button {
                            calculator.divisionPressed()
                        } label: {
                            ButtonLabel("÷")
                        }
                        Button {
                            calculator.multiplicationPressed()
                        } label: {
                            ButtonLabel("×")
                        }
                    }
                    VStack {
                        Button {
                            calculator.cPressed()
                        } label: {
                            ButtonLabel("C")
                        }
                        Button {
                            calculator.rorPressed()
                        } label: {
                            ButtonLabel("RoR")
                        }
                        Button {
                            
                        } label: {
                            ButtonLabel("1´s")
                        }
                        .disabled(true)
                        Button {
                            calculator.minusPressed()
                        } label: {
                            ButtonLabel("−")
                        }
                        Button {
                            calculator.plusPressed()
                        } label: {
                            ButtonLabel("+")
                        }
                    }
                }
                Button {
                    calculator.returnPressed()
                } label: {
                    ButtonLabel("⏎")
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct ProgrammerKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammerKeyboard(calculator: Binding.constant(RPNCalculator()))
    }
}
