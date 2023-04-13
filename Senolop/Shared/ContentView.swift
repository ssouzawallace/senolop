//
//  ContentView.swift
//  Shared
//
//  Created by Wallace Silva on 19/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var calculator: Calculator = RPN(CalculatorHapticsFeedbackHandlerImpl())
    
    var body: some View {
        CalculatorView(calculator: $calculator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .preferredColorScheme(.light)
            
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .preferredColorScheme(.dark)
            
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
            .preferredColorScheme(.dark)
            
    //        CalculatorView(calculator: .constant(RPN()))
    //        .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation) (16GB)"))
    }
}
