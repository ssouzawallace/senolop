//
//  CreditsView.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 19/07/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Senolop").font(.title)
            Text(NSLocalizedString("credits.tagline",
                                   value: "An RPN calculator built with SwiftUI.",
                                   comment: ""))
                .font(.body).foregroundColor(.secondary)
            Text("v\(Bundle.main.shortVersion)").font(.caption2).foregroundColor(.secondary)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}

