//
//  CreditsView.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 19/07/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        Group {
            Text("Hello, World!")
            Group {
                Text("Me")
                Text("Myself")
                Text("And")
                Text("I")
            }
            .font(.body)
        }.font(.title)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
