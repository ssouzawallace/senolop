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
    @State private var mode: RPNCalculator.VisualizationMode = .programmer
    @State private var calculator = RPNCalculator()
    
    func copy() {
        
    }
    
    func export() {
        
    }
    
    func clear() {
        
    }

    func switchStyle(_ style: Style) {
        
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
            

#if os(iOS)
            CalculatorView(mode: $mode, calculator: $calculator, buttonColor: $buttonColor)
#endif

#if os(macOS)
            VStack {
                Text("Senolop")
                Display(mode: $mode, calculator: $calculator)
                    #if os(iOS)
                    ColorPicker(selection: $buttonColor) {
                        Text("Button color")
                    }
                    #endif
            }
            .padding()
            
            CalculatorView(mode: $mode, calculator: $calculator, buttonColor: $buttonColor)
#endif
            
        }
        .navigationTitle("Senolop")
        #if os(iOS)
        .navigationViewStyle(.columns)
        #endif
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
    }
}
