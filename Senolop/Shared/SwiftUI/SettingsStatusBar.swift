//
//  SettingsStatusBar.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 19/02/24.
//

import SwiftUI

struct SettingsStatusBar: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "gear")
                })
            }
        }
    }
}

#Preview {
    SettingsStatusBar()
}
