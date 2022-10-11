//
//  MyButton.swift
//  Senolop
//
//  Created by Wallace Silva on 08/10/22.
//

import SwiftUI

struct CalculatorButton: View {
    let action: () -> Void
    let labelContent: String    
    let expandHorizontally: Bool
    let backgroundColor: Color?
    let helper = HapticsHelper.sharedInstance
    
    /// Creates a button that displays a custom label.
    ///
    /// - Parameters:
    ///   - action: The action to perform when the user triggers the button.
    ///   - label: A view that describes the purpose of the button's `action`.
    ///   ///   - expandHorizontally: Does the button fills the container view horizontally. Default is `false`.
    ///   ///   - backgroundColor: The buttons background color. Default is `nil`.
    public init(action: @escaping () -> Void, labelContent: String, expandHorizontally: Bool = true, backgroundColor: Color? = nil) {
        self.action = action
        self.labelContent = labelContent
        self.expandHorizontally = expandHorizontally
        self.backgroundColor = backgroundColor
    }
    
    func performAction() {
        action()
        helper.tap()
    }
    
    var attributedContent: AttributedString {
        AttributedString(labelContent)
    }
    
    var body: some View {
        Button(action: {
            performAction()
        }, label: {
            Text(attributedContent)
                .lineLimit(1)
                .frame(maxWidth: expandHorizontally ? .infinity : nil)
        })
        .background(backgroundColor)
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(action: {
            /* do nothing */
        }, labelContent: "0")
    }
}
