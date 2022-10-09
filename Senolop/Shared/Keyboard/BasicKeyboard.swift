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
                Button {
                    calculator.swapPressed()
                } label: {
                    ButtonLabel("x↔y")
                }
                Button {
                    calculator.rowDownPressed()
                } label: {
                    ButtonLabel("R↓")
                }
                Button {
                    calculator.rowUpPressed()
                } label: {
                    ButtonLabel("R↑")
                }
                Button {
                    calculator.deletePressed()
                } label: {
                    Image(systemName: "delete.backward")
                        .accessibilityHint("Delete the current row.")
                }
            }
            
            HStack {
                if calculator.cleanState {
                    Button {
                        calculator.acPressed()
                    } label: {
                        ButtonLabel("AC")
                    }
                } else {
                    Button {
                        calculator.cPressed()
                    } label: {
                        ButtonLabel("C")
                    }
                }
                
                Button {
                    calculator.invertSignalPressed()
                } label: {
                    ButtonLabel("±")
                }
                Button {
                    calculator.moduloPressed()
                } label: {
                    ButtonLabel("%")
                }
                .disabled(true)
                Button {
                    calculator.divisionPressed()
                } label: {
                    ButtonLabel("÷")
                }
            }
            
            HStack {
                VStack {
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
                        Button {
                            calculator.multiplicationPressed()
                        } label: {
                            ButtonLabel("×")
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
                        Button {
                            calculator.minusPressed()
                        } label: {
                            ButtonLabel("−")
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
                        Button {
                            calculator.plusPressed()
                        } label: {
                            ButtonLabel("+")
                        }
                    }
                    
                    HStack {
                        Button {
                            calculator.digitPressed(0)
                        } label: {
                            ButtonLabel("0")
                        }
                        Button {
                            calculator.commaPressed()
                        } label: {
                            Text(".")
                        }
                        Button {
                            calculator.returnPressed()
                        } label: {
                            Text("⏎")
                        }
                    }
                }
            }
        }
        .fixedSize(horizontal: true, vertical: true)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct BasicKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        BasicKeyboard(calculator: Binding.constant(RPNCalculator()))
    }
}
