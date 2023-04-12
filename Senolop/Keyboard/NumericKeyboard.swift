//
//  NumericKeyboard.swift
//  Senolop
//
//  Created by Wallace Silva on 27/12/22.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}

struct NumericKeyboard: View {
    let buttons = [
        ["7", "8", "9", "×"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ",", ]
    ]
    
    let spacing: CGFloat = 8
    
    var body: some View {
        VStack(spacing: spacing) {
            HStack {
                
                Button("C", action: {})
                Button(action: {}) {
                    Image(systemName: "plus.forwardslash.minus")
                }
                Button(action: {}) {
                    Image(systemName: "percent")
                }
                Button(action: {}) {
                    Image(systemName: "divide")
                }
                    .buttonStyle(MyStyle(proeminent: true))
            }
            HStack {
                Button("7", action: {})
                Button("8", action: {})
                Button("9", action: {})
                Button(action: {}) {
                    Image(systemName: "multiply")
                }
                    .buttonStyle(MyStyle(proeminent: true))
            }
            HStack {
                Button("4", action: {})
                Button("5", action: {})
                Button("6", action: {})
                Button(action: {}) {
                    Image(systemName: "minus")
                }
                    .buttonStyle(MyStyle(proeminent: true))
            }
            HStack {
                Button("1", action: {})
                Button("2", action: {})
                Button("3", action: {})
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                    .buttonStyle(MyStyle(proeminent: true))
                    
            }
            HStack {
                Button("0", action: {})
                    .buttonStyle(MyStyle(squared: false))
                
                HStack {
                    Button(",", action: {})
                    Button(action: {}) {
                        Image(systemName: "return")
                    }
                        .buttonStyle(MyStyle(proeminent: true))
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            
        }
        .padding()
        .buttonStyle(MyStyle())
    }
}

struct MyStyle: ButtonStyle {
    var squared = true
    var proeminent = false
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .center) {
            Capsule(style: .continuous)
                .fill(proeminent ? Color("AccentColor") : .gray)
                .if(squared) { view in
                    view.aspectRatio(1, contentMode: .fit)
                }
            
            configuration.label
        }
        .opacity(configuration.isPressed ? 0.5 : 1.0)
        .font(.largeTitle)
    }
}
struct NumericKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        NumericKeyboard()
    }
}
