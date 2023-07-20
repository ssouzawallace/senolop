//
//  ContentView.swift
//  Shared
//
//  Created by Wallace Silva on 19/07/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var calculator: Calculator
    
    var body: some View {
        CalculatorView(calculator: $calculator)
            .frame(minWidth: 400, minHeight: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(calculator: .constant(RPN()))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .preferredColorScheme(.light)
    }
}
