//
//  IntroView.swift
//  Calculator
//
//  Created by Wallace Silva on 08/09/22.
//

import SwiftUI
import Charts

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
            
            if #available(iOS 16.0, *) {
                Chart {
                    BarMark(
                        x: .value("Shape Type", data[0].type),
                        y: .value("Total Count", data[0].count)
                    )
                    BarMark(
                        x: .value("Shape Type", data[1].type),
                        y: .value("Total Count", data[1].count)
                    )
                    BarMark(
                        x: .value("Shape Type", data[2].type),
                        y: .value("Total Count", data[2].count)
                    )
                }
            } else {
                Image(systemName: "globe")
                                .padding()
                // Fallback on earlier versions
            }
            
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
