//
//  ContentView.swift
//  Shared
//
//  Created by Wallace Silva on 19/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonColor: Color = .gray
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
                ColorPicker("Button color", selection: $buttonColor)
            }
            .padding()
            VStack(alignment: .center, spacing: 0) {
                Display(mode: $mode, calculator: $calculator)
                Picker("Mode", selection: $mode) {
                    Text(RPNCalculator.VisualizationMode.basic.rawValue).tag(RPNCalculator.VisualizationMode.basic)
                    Text(RPNCalculator.VisualizationMode.scientific.rawValue).tag(RPNCalculator.VisualizationMode.scientific)
                    Text(RPNCalculator.VisualizationMode.programmer.rawValue).tag(RPNCalculator.VisualizationMode.programmer)
                }
                .pickerStyle(.segmented)
                .padding()
                Keyboard(calculator: $calculator, mode: mode)
                    .padding()
            }
            .padding()
            .foregroundColor(buttonColor)
            .background(Color("BackgroundColor"))
        }
        .navigationTitle("Senolop")
        .navigationViewStyle(.columns)
        .toolbar {
            ToolbarItemGroup {
                Button(action: copy) {
                    Image(systemName: "doc.on.doc")
                }
                Button(action: copy) {
                    Image(systemName: "square.and.arrow.up")
                }
                Button(action: copy) {
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
            .previewInterfaceOrientation(.landscapeRight)
    }
}
