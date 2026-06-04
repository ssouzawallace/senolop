//
//  SettingsStatusBar.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 19/02/24.
//

import SwiftUI

/// Compact bar shown above the calculator with quick access to history and settings.
struct SettingsStatusBar: View {
    @Binding var showSettings: Bool
    @Binding var showHistory: Bool
    @EnvironmentObject private var store: StoreManager

    var body: some View {
        HStack(spacing: 12) {
            Button(action: { showHistory = true }) {
                Image(systemName: "clock")
            }
            .accessibilityLabel(NSLocalizedString("a11y.history", value: "History", comment: ""))

            Spacer()

            if !store.isUnlocked {
                Text("PRO")
                    .font(.caption2).bold()
                    .foregroundColor(.accentColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Capsule().stroke(Color.accentColor))
            }

            Button(action: { showSettings = true }) {
                Image(systemName: "gear")
            }
            .accessibilityLabel(NSLocalizedString("a11y.settings", value: "Settings", comment: ""))
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}

/// Settings sheet — theme, precision, angle mode, haptics, restore-purchases.
struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("theme_selected_preference") private var themeIndex: Int = 0
    @AppStorage("decimal_precision_preference") private var precision: Int = 10
    @AppStorage("use_radians_preference") private var useRadians: Bool = true
    @AppStorage("sound_haptics_feedback_enabled_preference") private var hapticsEnabled: Bool = true
    @EnvironmentObject private var store: StoreManager
    @State private var showPaywall = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $themeIndex) {
                        ForEach(Theme.allCases.indices, id: \.self) { i in
                            Text(Theme.allCases[i].rawValue.capitalized).tag(i)
                        }
                    }
                }

                Section(header: Text("Calculation")) {
                    Stepper(value: $precision, in: 2...15) {
                        Text("Display precision: \(precision)")
                    }
                    Toggle(isOn: $useRadians) {
                        Text(useRadians ? "Angles: Radians" : "Angles: Degrees")
                    }
                }

                Section(header: Text("Feedback")) {
                    Toggle("Haptic feedback", isOn: $hapticsEnabled)
                }

                Section(header: Text("Senolop Pro")) {
                    if store.isUnlocked {
                        Label("Pro features unlocked", systemImage: "checkmark.seal.fill")
                            .foregroundColor(.green)
                    } else {
                        Button("Upgrade to Pro") { showPaywall = true }
                    }
                    Button("Restore Purchases") {
                        Task { await store.restore() }
                    }
                }

                Section(header: Text("About")) {
                    LabeledContent("Version", value: Bundle.main.shortVersion)
                    Link("Privacy Policy",
                         destination: URL(string: "https://github.com/ssouzawallace/senolop")!)
                    Link("Terms of Service",
                         destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")!)
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
            .sheet(isPresented: $showPaywall) {
                SubscriptionView().environmentObject(store)
            }
        }
    }
}

extension Bundle {
    var shortVersion: String {
        (infoDictionary?["CFBundleShortVersionString"] as? String) ?? "1.0"
    }
}

#Preview {
    SettingsStatusBar(showSettings: .constant(false), showHistory: .constant(false))
        .environmentObject(StoreManager.preview)
}

