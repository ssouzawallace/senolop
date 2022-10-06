//
//  Keyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 02/09/22.
//

import SwiftUI

struct Keyboard: View {
    @Binding var calculator: RPNCalculator
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    calculator.swapPressed()
                } label: {
                    Text("x↔y")
                }
                Button {
                    calculator.rowDownPressed()
                } label: {
                    Text("R↓")
                }
                Button {
                    calculator.rowUpPressed()
                } label: {
                    Text("R↑")
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
                        Text("AC")
                    }
                } else {
                    Button {
                        calculator.cPressed()
                    } label: {
                        Text("C")
                    }
                }
                
                Button {
                    calculator.invertSignalPressed()
                } label: {
                    Text("±")
                }
                Button {
                    calculator.moduloPressed()
                } label: {
                    Text("%")
                }
                .disabled(true)
                Button {
                    calculator.divisionPressed()
                } label: {
                    Text("÷")
                }
            }
            
            HStack {
                VStack {
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
                            calculator.digitPressed(0)
                        } label: {
                            Text("0")
                        }
                        
                        Button {
                            calculator.commaPressed()
                        } label: {
                            Text(".")
                        }
                    }
                }
                VStack {
                    Button {
                        calculator.multiplicationPressed()
                    } label: {
                        Text("×")
                    }
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
                    Button {
                        calculator.returnPressed()
                    } label: {
                        Text("⏎")
                    }
                }
            }
        }
        .fixedSize(horizontal: true, vertical: true)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(calculator: Binding.constant(RPNCalculator()))
    }
}
