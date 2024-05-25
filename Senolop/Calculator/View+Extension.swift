//
//  View+Extension.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 25/05/24.
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
