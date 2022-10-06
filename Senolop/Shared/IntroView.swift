//
//  IntroView.swift
//  Calculator
//
//  Created by Wallace Silva on 08/09/22.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack {
            Text("Senolop")
                .font(.title)
            Text("A sua calculadora RPN")
                .font(.body)
            Button {
                
            } label: {
                Text("Iniciar").font(.callout)
            }

        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
