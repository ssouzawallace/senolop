//
//  ContentView.swift
//  Shared
//
//  Created by Wallace Silva on 19/07/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var calculator: CalculatorProtocol
    
    var body: some View {
        Calculator(calculator: $calculator)
            .frame(minWidth: 400, minHeight: 400)
            .frame(maxWidth: 600, maxHeight: 800)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(calculator: .constant(RPN()))            
    }
}
