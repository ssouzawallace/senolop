//
//  MyButton.swift
//  Senolop
//
//  Created by Wallace Silva on 08/10/22.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case orange
    case mint
    case strawberry
    case lime
    case grape
    case mango
    
    var color: Color {        
        Color(rawValue.capitalized)
    }
}

struct CalculatorButtonStyle: ButtonStyle {
    @AppStorage("theme_selected_preference")
    private var themeSelectedPreference = 0
    
    var squared = true
    var proeminent = false
    var special = false
    private var color: Color {
        if proeminent {
            return Theme.allCases[themeSelectedPreference].color
        } else {
            if special {
                return Color("SpecialButtonColor")
            } else {
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
    var title: String
    var style: CalculatorButtonStyle
    var body: some View {
        VStack {
            Button(title, action: { })
                .buttonStyle(CalculatorButtonStyle())
            
            HStack {
                Button("ABC", action: { })
                Button("ABC", action: { })
            }
            .buttonStyle(CalculatorButtonStyle(proeminent: true))
            
            VStack {
                Button("ABC", action: { })
                Button("ABC", action: { })
            }
            .buttonStyle(CalculatorButtonStyle(squared: false, proeminent: true))
        }
        .padding()
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(title: "X", style: CalculatorButtonStyle(proeminent: true))
    }
}
