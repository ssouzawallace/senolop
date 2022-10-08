//
//  IntroView.swift
//  Calculator
//
//  Created by Wallace Silva on 08/09/22.
//

import SwiftUI

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

var data: [ToyShape] = [
    .init(type: "Cube", count: 5),
    .init(type: "Sphere", count: 4),
    .init(type: "Pyramid", count: 4)
]

struct IntroView: View {
    var body: some View {
        VStack {
            Text("Senolop")
                .font(.title)
            
            Text("A sua calculadora RPN")
                .font(.body)
                .padding()
            
            Image(systemName: "globe")
                .animation(.linear.repeatForever())
                .padding()
            
            Button {
                
            } label: {
                Text("Iniciar").font(.callout)
            }
            .padding()
        }
        .padding()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
