//
//  ContentView.swift
//  Shared
//
//  Created by Wallace Silva on 19/07/22.
//

import SwiftUI

struct ContentView: View {
    enum Style {
        case kids
        case adult
        case fun
    }
    @State private var buttonColor: Color = .accentColor
    @State private var mode: RPNCalculator.VisualizationMode = .basic
    @State private var calculator = RPNCalculator()
    @State private var backgroundColorName = "BackgroundColor 1"
    
    func copy() {
    }
    
    func back() {
    }
    
    func switchStyle(_ style: Style) {
        switch style {
        case .adult:
            backgroundColorName = "BackgroundColor 1"
        case .kids:
            backgroundColorName = "BackgroundColor 2"
        case .fun:
            backgroundColorName = "BackgroundColor 3"
        }
    }
    
    func switchStyle1() {
        switchStyle(.kids)
    }
    
    func switchStyle2() {
        switchStyle(.adult)
    }
    
    func switchStyle3() {
        switchStyle(.fun)
    }
    
    var body: some View {
        NavigationView {
            if #available(macOS 12, *) {
                Text("Senolop")
                Display(mode: $mode, calculator: $calculator)
            }
            CalculatorView(mode: $mode,
                           calculator: $calculator,
                           buttonColor: $buttonColor)
        }
        .padding()
        .background(Color(backgroundColorName))
        .navigationTitle("Senolop")
        .toolbar {
            ToolbarItemGroup {
                Button(action: copy) {
                    Image(systemName: "doc.on.doc")
                }
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
                Button(action: back) {
                    Image(systemName: "xmark.circle")
                }
                Button(action: switchStyle1) {
                    Image(systemName: "1.circle")
                }
                Button(action: switchStyle2) {
                    Image(systemName: "2.circle")
                }
                Button(action: switchStyle3) {
                    Image(systemName: "3.circle")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
