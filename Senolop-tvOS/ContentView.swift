//
//  ContentView.swift
//  Senolop-tvOS
//
//  Created by Wallace Souza Silva on 05/01/24.
//

import SwiftUI

// NOTE: tvOS support is currently a placeholder. The shared calculator core
// (`RPN`, `CalculatorProtocol`, etc.) is portable, but the SwiftUI keyboards
// are tuned for touch input. Wire this up before shipping a tvOS build.
struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "function")
                .resizable().scaledToFit().frame(width: 120, height: 120)
                .foregroundColor(.accentColor)
            Text("Senolop").font(.largeTitle)
            Text("tvOS support is in progress.").foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

