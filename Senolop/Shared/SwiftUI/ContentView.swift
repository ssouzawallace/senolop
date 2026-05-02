//
//  ContentView.swift
//  Shared
//
//  Created by Wallace Silva on 19/07/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var calculator: CalculatorProtocol
    @AppStorage("has_seen_intro") private var hasSeenIntro: Bool = false
    @State private var showSettings = false
    @State private var showHistory = false
    @State private var lastRecorded: String = ""
    @StateObject private var store = StoreManager()

    var body: some View {
        ZStack {
            if hasSeenIntro {
                VStack(spacing: 0) {
                    SettingsStatusBar(
                        showSettings: $showSettings,
                        showHistory: $showHistory
                    )
                    Calculator(calculator: $calculator)
                }
            } else {
                IntroView(hasSeenIntro: Binding(
                    get: { hasSeenIntro },
                    set: { hasSeenIntro = $0 }
                ))
            }
        }
        .environmentObject(store)
        .onChange(of: calculator.stack.last?.value ?? "") { newValue in
            // Record meaningful results (not transient digit entry).
            // Heuristic: long values or scientific results worth keeping.
            guard newValue.count > 1 || (Double(newValue) ?? 0) != 0 else { return }
            if newValue != lastRecorded {
                lastRecorded = newValue
                HistoryStore.shared.record(newValue)
            }
        }
        .task {
            await store.loadProducts()
            await store.refreshEntitlements()
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .environmentObject(store)
        }
        .sheet(isPresented: $showHistory) {
            DocumentsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(calculator: .constant(RPN()))
            .padding(EdgeInsets())
    }
}

