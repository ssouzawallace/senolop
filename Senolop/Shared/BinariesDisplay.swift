//
//  BinariesDisplay.swift
//  Calculator
//
//  Created by Wallace Silva on 08/09/22.
//

import SwiftUI

struct BinariesDisplay: View {
    let value: Int
    var text: String {
        guard value != 0 else {
            return "0"
        }
        var value = value
        var result = ""
        while value > 0 {
            result = String(value % 2) + result
            value /= 2
        }
        return result
    }
    var body: some View {
        Text(text)
    }
}

struct BinariesDisplay_Previews: PreviewProvider {
    static var previews: some View {
        BinariesDisplay(value: 10)
    }
}
