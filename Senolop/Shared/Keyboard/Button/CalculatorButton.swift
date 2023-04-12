//
//  MyButton.swift
//  Senolop
//
//  Created by Wallace Silva on 08/10/22.
//

import SwiftUI

struct CalculatorButton: View {
    
    enum LabelContent {
        case symbol(String)
        case string(String)
    }
    
    let action: () -> Void
    let labelContent: LabelContent
    let expandHorizontally: Bool
    let expandVertically: Bool
    let squared: Bool
    let backgroundColor: Color?
    let helper = HapticsHelper.sharedInstance
    
    var labelContentList: [String] = []
    
    /// Creates a button that displays a custom label.
    ///
    /// - Parameters:
    ///   - action: The action to perform when the user triggers the button.
    ///   - label: A view that describes the purpose of the button's `action`.
    ///   ///   - expandHorizontally: Does the button fills the container view horizontally. Default is `false`.
    ///   ///   - backgroundColor: The buttons background color. Default is `nil`.
    public init(action: @escaping () -> Void, labelContent: LabelContent, expandHorizontally: Bool = true, expandVertically: Bool = true, squared: Bool = true, backgroundColor: Color? = nil) {
        self.action = action
        self.labelContent = labelContent
        self.expandHorizontally = expandHorizontally
        self.expandVertically = expandVertically
        self.squared = squared
        self.backgroundColor = backgroundColor
    }
    
    func performAction() {
        action()
        helper.tap()
    }
    
    var body: some View {
        Button(action: {
            performAction()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.purple)
                switch labelContent {
                case .symbol(let systemName):
                    Image(systemName: systemName)
                case .string(let string):
                    Text(AttributedString(string))
                    
                }
            }
        })
        .frame(width: expandHorizontally ? .infinity : nil, height: expandVertically ? .infinity : nil)
        .aspectRatio(squared ? 1 : nil, contentMode: .fill)
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(action: {
            /* do nothing */
        }, labelContent: .string("0"))
    }
}

struct MyStyle: ButtonStyle {
    var squared = true
    var proeminent = false
    var special = false
    private var color: Color {
        if proeminent {
            return Color("AccentColor")
        } else {
            if special {
                return .yellow
            } else {
                return .gray
            }
        }
    }
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .center) {
            Capsule(style: .continuous)
                .fill(color)
                .if(squared) { view in
                    view.aspectRatio(1, contentMode: .fit)
                }
            
            configuration.label
        }
        .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}
