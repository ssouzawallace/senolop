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
            return Color("OperationButtonColor")
        } else {
            if special {
                return Color("SpecialButtonColor")
            } else {
                return Color("NumericButtonColor")
            }
        }
    }
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .center) {
            Capsule(style: .continuous)
                .fill(color)
                .if(squared) { view in
                    view.aspectRatio(1, contentMode: .fit)
                }
            
            configuration.label
                .font(.system(.title2,
                              design: .none,
                              weight: .medium))
                .minimumScaleFactor(0.54)
                .scaledToFit()
            
            
        }
        .foregroundColor(.primary)
        .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}
