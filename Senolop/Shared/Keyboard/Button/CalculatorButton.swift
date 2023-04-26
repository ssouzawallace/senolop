//
//  MyButton.swift
//  Senolop
//
//  Created by Wallace Silva on 08/10/22.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    var squared = true
    var proeminent = false
    var special = false
    private var color: Color {
        if proeminent {
            // return .purple // Color("OperationButtonColor")
            return Color("OperationButtonColor")
        } else {
            if special {
                // return .blue // Color("SpecialButtonColor")
                return Color("SpecialButtonColor")
            } else {
                // return .yellow // Color("NumericButtonColor")
                return  Color("NumericButtonColor")
            }
        }
    }
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Capsule(style: .continuous)
                .foregroundColor(color)
        
            configuration.label
                .font(.system(.title3))
                .padding(.vertical)
        }
        .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}



struct CalculatorButton: View {
    var body: some View {
        VStack {
            Button("ABC", action: { })
//                .if(#available (true), transform: { view in
//                    view                    
//                        .buttonStyle(.borderedProminent)
//                        .buttonBorderShape(.roundedRectangle)
//                    
//                })
            HStack {
                Button("ABC", action: { })
                Button("ABC", action: { })
            }
            .aspectRatio(1, contentMode: .fit)
            VStack {
                Button("ABC", action: { })
                Button("ABC", action: { })
            }
        }
        .buttonStyle(CalculatorButtonStyle(proeminent: true))
        .buttonStyle(CalculatorButtonStyle(squared: false, proeminent: true))
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
