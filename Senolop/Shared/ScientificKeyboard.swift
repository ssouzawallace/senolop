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
                    Text("(")
                }
                .disabled(true)

                if calculator.moreFunctions {
                    Button {
                        calculator.lessFunctionsPressed()
                    } label: {
                        Text("2nd")
                    }
                    .background(.orange)
                } else {
                    Button {
                        calculator.moreFunctionsPressed()
                    } label: {
                        Text("2nd")
                    }
                }
                
                Button {
                    calculator.inversePressed()
                } label: {
                    Text("1/x")
                }
                
                Button {
                    calculator.xFactorialPressed()
                } label: {
                    Text("x!")
                }
                
                
                if calculator.mode == .deg {
                    Button {
                        calculator.radPressed()
                    } label: {
                        Text("Rad")
                    }
                } else {
                    Button {
                        calculator.degPressed()
                    } label: {
                        Text("Deg")
                    }
                }
            }
            
            VStack {
                Button {
                } label: {
                    Text(")")
                }
                .disabled(true)

                Button {
                    calculator.x2Pressed()
                } label: {
                    Text("x^2")
                }
                
                Button {
                    calculator.sqrtPressed()
                } label: {
                    Text("sqrt(x)")
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.sinInvPressed()
                    } label: {
                        Text("sin⁻¹")
                    }
                } else {
                    Button {
                        calculator.sinPressed()
                    } label: {
                        Text("sin")
                    }
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.sinhInvPressed()
                    } label: {
                        Text("sinh⁻¹")
                    }
                } else {
                    Button {
                        calculator.sinhPressed()
                    } label: {
                        Text("sinh")
                    }
                }
            }
            
            VStack {
                Button {
                    calculator.mcPressed()
                } label: {
                    Text("mc")
                }

                Button {
                    calculator.x3Pressed()
                } label: {
                    Text("x^3")
                }
                
                Button {
                    calculator.sqrt3Pressed()
                } label: {
                    Text("sqrt(x, 3)")
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.cosInvPressed()
                    } label: {
                        Text("cos⁻¹")
                    }
                } else {
                    Button {
                        calculator.cosPressed()
                    } label: {
                        Text("cos")
                    }
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.coshInvPressed()
                    } label: {
                        Text("cosh⁻¹")
                    }
                } else {
                    Button {
                        calculator.coshPressed()
                    } label: {
                        Text("cosh")
                    }
                }
            }
            
            VStack {
                Button {
                    calculator.mPlusPressed()
                } label: {
                    Text("m+")
                }

                Button {
                    calculator.yxPressed()
                } label: {
                    Text("y^x")
                }
                
                Button {
                    calculator.sqrtyxPressed()
                } label: {
                    Text("sqrt(y, x)")
                }
                .disabled(true)
                
                if calculator.moreFunctions {
                    Button {
                        calculator.tanInvPressed()
                    } label: {
                        Text("tan⁻¹")
                    }
                } else {
                    Button {
                        calculator.tanPressed()
                    } label: {
                        Text("tan")
                    }
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.tanhInvPressed()
                    } label: {
                        Text("tanh⁻¹")
                    }
                } else {
                    Button {
                        calculator.tanhPressed()
                    } label: {
                        Text("tanh")
                    }
                }
            }
            
            VStack {
                Button {
                    calculator.mMinusPressed()
                } label: {
                    Text("m-")
                }

                if calculator.moreFunctions {
                    Button {
                        calculator.xPoweredByYPressed()
                    } label: {
                        Text("x^y")
                    }
                } else {
                    Button {
                        calculator.ePoweredByXPressed()
                    } label: {
                        Text("e^x")
                    }
                }
                
                
                if calculator.moreFunctions {
                    Button {
                        calculator.lnyPressed()
                    } label: {
                        Text("lny")
                    }
                } else {
                    Button {
                        calculator.lognPressed()
                    } label: {
                        Text("ln")
                    }
                }
                
                Button {
                    calculator.ePressed()
                } label: {
                    Text("e")
                }
                
                Button {
                    calculator.piPressed()
                } label: {
                    Text("π")
                }
            }
            
            VStack {
                Button {
                    calculator.mrPressed()
                } label: {
                    Text("mr")
                }

                if calculator.moreFunctions {
                    Button {
                        calculator.twoPoweredByXPressed()
                    } label: {
                        Text("2^x")
                    }
                } else {
                    Button {
                        calculator.tenPoweredByXPressed()
                    } label: {
                        Text("10^x")
                    }
                }
                
                if calculator.moreFunctions {
                    Button {
                        calculator.log2Pressed()
                    } label: {
                        Text("log2")
                    }
                } else {
                    Button {
                        calculator.log10Pressed()
                    } label: {
                        Text("log10")
                    }
                }
                                
                Button {
                    calculator.eePressed()
                } label: {
                    Text("EE")
                }
                
                Button {
                    calculator.randPressed()
                } label: {
                    Text("Rand")
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
