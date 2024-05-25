//
//  SenolopApp.swift
//  Senolop
//
//  Created by Wallace Silva on 06/10/22.
//

import SwiftUI

@main
struct SenolopApp: App {
    
    @State var calculator: CalculatorProtocol = RPN(CalculatorHapticsFeedbackHandlerImpl())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
