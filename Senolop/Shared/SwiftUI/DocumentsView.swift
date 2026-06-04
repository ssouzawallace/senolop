//
//  DocumentsView.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 24/05/24.
//

import SwiftUI

/// A simple, persistable history record of past results.
struct HistoryEntry: Codable, Identifiable {
    var id: UUID = UUID()
    let value: String
    let timestamp: Date
}

/// Lightweight history store backed by UserDefaults. Capped to 200 entries.
final class HistoryStore: ObservableObject {
    @Published private(set) var entries: [HistoryEntry] = []
    private let key = "senolop_history_v1"
    static let shared = HistoryStore()

    private init() { load() }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([HistoryEntry].self, from: data) else { return }
        self.entries = decoded
    }

    private func save() {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func record(_ value: String) {
        guard !value.isEmpty, value != "0" else { return }
        let entry = HistoryEntry(value: value, timestamp: Date())
        entries.insert(entry, at: 0)
        if entries.count > 200 { entries = Array(entries.prefix(200)) }
        save()
    }

    func clear() {
        entries.removeAll()
        save()
    }
}

struct DocumentsView: View {
    @StateObject private var history = HistoryStore.shared
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            Group {
                if history.entries.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "clock.badge.questionmark")
                            .font(.system(size: 48))
                            .foregroundColor(.secondary)
                        Text(NSLocalizedString("history.empty",
                                               value: "No history yet. Your past results will appear here.",
                                               comment: ""))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                    }
                } else {
                    List {
                        ForEach(history.entries) { entry in
                            HStack {
                                Text(entry.value).font(.title3).monospacedDigit()
                                Spacer()
                                Text(entry.timestamp, format: .dateTime.hour().minute().day().month())
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("History")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") { dismiss() }
                }
                ToolbarItem(placement: .destructiveAction) {
                    Button(role: .destructive) {
                        history.clear()
                    } label: { Image(systemName: "trash") }
                    .disabled(history.entries.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DocumentsView()
}

