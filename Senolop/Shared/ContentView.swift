//
//  ContentView.swift
//  Shared
//
//  Created by Wallace Silva on 19/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var mode: RPNCalculator.VisualizationMode = .basic
    @State private var calculator = RPNCalculator()
    
    func copy() {
        
    }
    
    func export() {
        
    }
    
    
    func clear() {
        
    }
    
    func switchStyle(_ id: Int) {
        
    }
    
    func switchStyle1() {
        switchStyle(1)
    }
    
    func switchStyle2() {
        switchStyle(2)
    }
    
    func switchStyle3() {
        switchStyle(3)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Senolop")
                Display(mode: $mode, calculator: $calculator)
            }
            VStack(alignment: .center, spacing: 0) {
                Picker("Mode", selection: $mode) {
                    Text(RPNCalculator.VisualizationMode.basic.rawValue).tag(RPNCalculator.VisualizationMode.basic)
                    Text(RPNCalculator.VisualizationMode.scientific.rawValue).tag(RPNCalculator.VisualizationMode.scientific)
                    Text(RPNCalculator.VisualizationMode.programmer.rawValue).tag(RPNCalculator.VisualizationMode.programmer)
                }
                Display(mode: $mode, calculator: $calculator)
                HStack {
                    if mode == .programmer { //&& UIDevice.current.orientation.isLandscape {
                        ProgrammerKeyboard(calculator: $calculator)
                    }
                    if mode == .scientific { //&& UIDevice.current.orientation.isLandscape {
                        ScientificKeyboard(calculator: $calculator)
                    }
                    if mode != .programmer {
                        Keyboard(calculator: $calculator)
                    }
                }
            }
            .background(Color("BackgroundColor"))
        }
        .navigationViewStyle(.columns)
        .navigationTitle("Senolop")
        .toolbar {
            Menu {
                Button("Copy", action: copy)
                Button("Export", action: export)
                Button("Clear", action: clear)
                Menu("Switch Style") {
                        Button("Style 1", action: switchStyle1)
                        Button("Style 2", action: switchStyle2)
                        Button("Style 3", action: switchStyle3)
                    }
            } label: {
                Label("Share", systemImage: "square.and.arrow.up")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
