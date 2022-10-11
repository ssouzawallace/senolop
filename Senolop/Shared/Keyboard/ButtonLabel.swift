//
//  MyButton.swift
//  Senolop
//
//  Created by Wallace Silva on 08/10/22.
//

import SwiftUI

struct ButtonLabel: View {
    let content: String
    var attributedContent: AttributedString {
        var attributedContent = AttributedString(stringLiteral: content)
        attributedContent.setAttributes(AttributeContainer([.strokeColor:Color.red]))
        return attributedContent
    }
    init(_ content: String) {
        self.content = content
    }
    
    var body: some View {
        Label {
            Text(attributedContent)
        } icon: {
//            Image(systemName: content + ".circle.fill")
        }        
        .padding()
        .lineLimit(1)
        .frame(maxWidth: .infinity)
}
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel("0")
    }
}