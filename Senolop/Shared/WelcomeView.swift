//
//  WelcomeView.swift
//  Senolop
//
//  Created by Wallace Silva on 08/10/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Senolop")
                .font(.custom("Futura", size: 42))
            Text("RPN CALCULATOR")
                .font(.custom("Futura", size: 42))
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
