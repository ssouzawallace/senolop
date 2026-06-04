//
//  IntroView.swift
//  Calculator
//
//  Created by Wallace Silva on 08/09/22.
//

import SwiftUI

/// First-launch onboarding. Shown until the user dismisses it; the dismissal
/// flips a `@AppStorage` flag so it never shows again.
struct IntroView: View {
    @Binding var hasSeenIntro: Bool

    private let pages: [(systemImage: String, title: String, body: String)] = [
        ("function",
         NSLocalizedString("intro.title.welcome",   value: "Welcome to Senolop", comment: ""),
         NSLocalizedString("intro.body.welcome",
                           value: "A fast, beautiful Reverse-Polish Notation calculator for iPhone and iPad.",
                           comment: "")),
        ("square.stack.3d.up",
         NSLocalizedString("intro.title.rpn", value: "Stack-based math", comment: ""),
         NSLocalizedString("intro.body.rpn",
                           value: "Type a number, press Enter to push it onto the stack, then choose an operator. No parentheses needed.",
                           comment: "")),
        ("bolt.fill",
         NSLocalizedString("intro.title.example", value: "Try it: 3 ↵ 4 +", comment: ""),
         NSLocalizedString("intro.body.example",
                           value: "Press 3, then Enter, then 4, then +. The stack shows 7. That’s it.",
                           comment: ""))
    ]

    @State private var index = 0

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            TabView(selection: $index) {
                ForEach(pages.indices, id: \.self) { i in
                    VStack(spacing: 16) {
                        Image(systemName: pages[i].systemImage)
                            .resizable().scaledToFit().frame(width: 80, height: 80)
                            .foregroundColor(.accentColor)
                        Text(pages[i].title).font(.title).bold().multilineTextAlignment(.center)
                        Text(pages[i].body).font(.body).multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .tag(i)
                    .padding()
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))

            Button {
                if index < pages.count - 1 {
                    withAnimation { index += 1 }
                } else {
                    hasSeenIntro = true
                }
            } label: {
                Text(index < pages.count - 1
                     ? NSLocalizedString("intro.next",       value: "Next",        comment: "")
                     : NSLocalizedString("intro.get_started", value: "Get Started", comment: ""))
                    .frame(maxWidth: 280)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)

            if index < pages.count - 1 {
                Button(NSLocalizedString("intro.skip", value: "Skip", comment: "")) {
                    hasSeenIntro = true
                }
                .font(.footnote)
            }
            Spacer()
        }
        .padding()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(hasSeenIntro: .constant(false))
    }
}

