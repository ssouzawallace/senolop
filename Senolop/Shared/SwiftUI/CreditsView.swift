//
//  CreditsView.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 19/07/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.title)
            Group {
                Text("Me")
                Text("Myself")
                Text("And")
                Text("I")
            }
            .font(.body)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
