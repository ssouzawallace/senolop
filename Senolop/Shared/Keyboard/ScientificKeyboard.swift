//
//  ScientificKeyboard.swift
//  Calculator
//
//  Created by Wallace Silva on 07/09/22.
//

import SwiftUI

struct ScientificKeyboard: View {
    @Binding var calculator: RPNCalculator
    
    var body: some View {
        HStack {
            VStack {
                Button {
                } label: {
                    ButtonLabel("(")
                }
                .disabled(true)

                if calculator.moreFunctions {
                    Button {
                        calculator.lessFunctionsPressed()
                    } label: {
                        ButtonLabel("2nd")
                    }
                    .background(.orange)
                } else {
                    Button {
                        calculator.moreFunctionsPressed()
                    } label: {
                        ButtonLabel("2nd")
                    }
                }
                
                Button {
                    calculator.inversePressed()
                } label: {
                    ButtonLabel("1/x")
                }
                
                Button {
                    calculator.xFactorialPressed()
                } label: {
                    ButtonLabel("x!")
                }
                
                
                if calculator.mode == .deg {
                    Button {
                        calculator.radPressed()
                    } label: {
                        ButtonLabel("Rad")
                    }
                } else {
                    Button {
                        calculator.degPressed()
                    } label: {
                        ButtonLabel("Deg")
                    }
                }
            }
            
            VStack {
                Button {
                } label: {
                    ButtonLabel(")")
                }
                .disabled(true)

                Button {
                    calculator.x2Pressed()
                } label: {
                    ButtonLabel("x^2")
                }
                
                Button {
                    calculator.sqrtPressed()
                } label: {
                    ButtonLabel("sqrt(x)")
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.sinInvPressed()
                    } label: {
                        ButtonLabel("sin⁻¹")
                    }
                } else {
                    Button {
                        calculator.sinPressed()
                    } label: {
                        ButtonLabel("sin")
                    }
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.sinhInvPressed()
                    } label: {
                        ButtonLabel("sinh⁻¹")
                    }
                } else {
                    Button {
                        calculator.sinhPressed()
                    } label: {
                        ButtonLabel("sinh")
                    }
                }
            }
            
            VStack {
                Button {
                    calculator.mcPressed()
                } label: {
                    ButtonLabel("mc")
                }

                Button {
                    calculator.x3Pressed()
                } label: {
                    ButtonLabel("x^3")
                }
                
                Button {
                    calculator.sqrt3Pressed()
                } label: {
                    ButtonLabel("sqrt(x, 3)")
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.cosInvPressed()
                    } label: {
                        ButtonLabel("cos⁻¹")
                    }
                } else {
                    Button {
                        calculator.cosPressed()
                    } label: {
                        ButtonLabel("cos")
                    }
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.coshInvPressed()
                    } label: {
                        ButtonLabel("cosh⁻¹")
                    }
                } else {
                    Button {
                        calculator.coshPressed()
                    } label: {
                        ButtonLabel("cosh")
                    }
                }
            }
            
            VStack {
                Button {
                    calculator.mPlusPressed()
                } label: {
                    ButtonLabel("m+")
                }

                Button {
                    calculator.yxPressed()
                } label: {
                    ButtonLabel("y^x")
                }
                
                Button {
                    calculator.sqrtyxPressed()
                } label: {
                    ButtonLabel("sqrt(y, x)")
                }
                .disabled(true)
                
                if calculator.moreFunctions {
                    Button {
                        calculator.tanInvPressed()
                    } label: {
                        ButtonLabel("tan⁻¹")
                    }
                } else {
                    Button {
                        calculator.tanPressed()
                    } label: {
                        ButtonLabel("tan")
                    }
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.tanhInvPressed()
                    } label: {
                        ButtonLabel("tanh⁻¹")
                    }
                } else {
                    Button {
                        calculator.tanhPressed()
                    } label: {
                        ButtonLabel("tanh")
                    }
                }
            }
            
            VStack {
                Button {
                    calculator.mMinusPressed()
                } label: {
                    ButtonLabel("m-")
                }

                if calculator.moreFunctions {
                    Button {
                        calculator.xPoweredByYPressed()
                    } label: {
                        ButtonLabel("x^y")
                    }
                } else {
                    Button {
                        calculator.ePoweredByXPressed()
                    } label: {
                        ButtonLabel("e^x")
                    }
                }
                
                
                if calculator.moreFunctions {
                    Button {
                        calculator.lnyPressed()
                    } label: {
                        ButtonLabel("lny")
                    }
                } else {
                    Button {
                        calculator.lognPressed()
                    } label: {
                        ButtonLabel("ln")
                    }
                }
                
                Button {
                    calculator.ePressed()
                } label: {
                    ButtonLabel("e")
                }
                
                Button {
                    calculator.piPressed()
                } label: {
                    ButtonLabel("π")
                }
            }
            
            VStack {
                Button {
                    calculator.mrPressed()
                } label: {
                    ButtonLabel("mr")
                }

                if calculator.moreFunctions {
                    Button {
                        calculator.twoPoweredByXPressed()
                    } label: {
                        ButtonLabel("2^x")
                    }
                } else {
                    Button {
                        calculator.tenPoweredByXPressed()
                    } label: {
                        ButtonLabel("10^x")
                    }
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.log2Pressed()
                    } label: {
                        ButtonLabel("log2")
                    }
                } else {
                    Button {
                        calculator.log10Pressed()
                    } label: {
                        ButtonLabel("log10")
                    }
                }
                                
                Button {
                    calculator.eePressed()
                } label: {
                    ButtonLabel("EE")
                }
                
                Button {
                    calculator.randPressed()
                } label: {
                    ButtonLabel("Rand")
                }
            }
        }
        .fixedSize(horizontal: true, vertical: true)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct ScientificKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        ScientificKeyboard(calculator: Binding.constant(RPNCalculator()))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
