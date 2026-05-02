//
//  KeyboardModeSelection.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 25/05/24.
//

import SwiftUI

/// The currently visible keyboard layout. Persisted across launches via `@AppStorage`.
enum KeyboardMode: String, CaseIterable, Identifiable {
    case numeric
    case scientific
    case programmer

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .numeric:    return NSLocalizedString("keyboard.mode.numeric",    value: "Numeric",    comment: "")
        case .scientific: return NSLocalizedString("keyboard.mode.scientific", value: "Scientific", comment: "")
        case .programmer: return NSLocalizedString("keyboard.mode.programmer", value: "Programmer", comment: "")
        }
    }

    /// Whether this mode requires a paid unlock.
    var requiresPro: Bool {
        switch self {
        case .numeric:    return false
        case .scientific, .programmer: return true
        }
    }
}

/// Segmented picker that lets the user choose between keyboard modes.
/// Locked modes show a small lock icon and trigger the paywall instead of switching.
struct KeyboardModeSelection: View {
    @AppStorage("keyboard_mode_preference") private var storedRaw: String = KeyboardMode.numeric.rawValue
    @EnvironmentObject private var store: StoreManager
    @State private var showPaywall = false
    @State private var attemptedMode: KeyboardMode = .scientific

    private var selection: KeyboardMode {
        get { KeyboardMode(rawValue: storedRaw) ?? .numeric }
    }

    var body: some View {
        HStack(spacing: 4) {
            ForEach(KeyboardMode.allCases) { mode in
                Button {
                    if mode.requiresPro && !store.isUnlocked {
                        attemptedMode = mode
                        showPaywall = true
                    } else {
                        storedRaw = mode.rawValue
                    }
                } label: {
                    HStack(spacing: 4) {
                        if mode.requiresPro && !store.isUnlocked {
                            Image(systemName: "lock.fill").font(.caption2)
                        }
                        Text(mode.displayName).font(.caption)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(selection == mode ? Color.accentColor.opacity(0.25) : Color.clear)
                    .clipShape(Capsule())
                }
                .buttonStyle(.plain)
                .accessibilityLabel(mode.displayName)
            }
        }
        .padding(4)
        .background(Color.secondary.opacity(0.1))
        .clipShape(Capsule())
        .sheet(isPresented: $showPaywall) {
            SubscriptionView(featureName: attemptedMode.displayName)
                .environmentObject(store)
        }
    }
}

#Preview {
    KeyboardModeSelection()
        .environmentObject(StoreManager.preview)
}

