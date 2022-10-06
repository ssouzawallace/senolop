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
                            Text("AND")
                        }
                        Button {
                            calculator.norPressed()
                        } label: {
                            Text("NOR")
                        }
                        Button {
                            calculator.leftShiftPressed()
                        } label: {
                            Text("<<")
                        }
                        Button {
                            calculator.xLeftShiftYPressed()
                        } label: {
                            Text("X<<Y")
                        }
                    }
                    VStack {
                        Button {
                            calculator.orPressed()
                        } label: {
                            Text("OR")
                        }
                        Button {
                            calculator.xorPressed()
                        } label: {
                            Text("XOR")
                        }
                        Button {
                            calculator.rightShiftPressed()
                        } label: {
                            Text(">>")
                        }
                        Button {
                            calculator.xRightShiftYPressed()
                        } label: {
                            Text("X>>Y")
                        }
                    }
                }
                Button {
                    calculator.invertBytePressed()
                } label: {
                    Text("inverter byte")
                }
                Button {
                    calculator.invertWordPressed()
                } label: {
                    Text("inverter palavra")
                }
            }
            NumericProgrammerKeyboard(calculator: $calculator)
            VStack {
                HStack {
                    VStack {
                        Button {
                            calculator.acPressed()
                        } label: {
                            Text("AC")
                        }
                        Button {
                            calculator.rolPressed()
                        } label: {
                            Text("RoL")
                        }
                        Button {
                            
                        } label: {
                            Text("2´s")
                        }
                        .disabled(true)
                        Button {
                            calculator.divisionPressed()
                        } label: {
                            Text("÷")
                        }
                        Button {
                            calculator.multiplicationPressed()
                        } label: {
                            Text("×")
                        }
                    }
                    VStack {
                        Button {
                            calculator.cPressed()
                        } label: {
                            Text("C")
                        }
                        Button {
                            calculator.rorPressed()
                        } label: {
                            Text("RoR")
                        }
                        Button {
                            
                        } label: {
                            Text("1´s")
                        }
                        .disabled(true)
                        Button {
                            calculator.minusPressed()
                        } label: {
                            Text("−")
                        }
                        Button {
                            calculator.plusPressed()
                        } label: {
                            Text("+")
                        }
                    }
                }
                Button {
                    calculator.returnPressed()
                } label: {
                    Text("⏎")
                }
            }
        }
        .fixedSize(horizontal: true, vertical: true)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct ProgrammerKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammerKeyboard(calculator: Binding.constant(RPNCalculator()))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
