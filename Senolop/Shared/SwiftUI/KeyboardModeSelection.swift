//
//  KeyboardModeSelection.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 25/05/24.
//

import SwiftUI

struct KeyboardModeSelection: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    KeyboardModeSelection()
}

enum KeyboardMode {
    case numeric
    case scientific
    case programmer
    case none
}

var keyboardMode: KeyboardMode = .scientific
