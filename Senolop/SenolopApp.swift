//
//  SenolopApp.swift
//  Senolop
//
//  Created by Wallace Silva on 06/10/22.
//

import SwiftUI

@main
struct SenolopApp: App {
    
    @State var calculator: Calculator = RPN(CalculatorHapticsFeedbackHandlerImpl())
    
    var body: some Scene {
            #if os(macOS)
            return WindowGroup {
                ContentView(calculator: $calculator)
                    .touchBar {
                        TouchBar(calculator: $calculator)
                    }
                    .buttonStyle(CalculatorButtonStyle(proeminent: true))
            }
            #else
            return WindowGroup {
                ContentView(calculator: $calculator)
            }
            #endif
    }
}
