//
//  SubscriptionView.swift
//  Calculator
//
//  Created by Wallace Silva on 08/09/22.
//

import SwiftUI
import StoreKit

/// Persistent unlock entitlement key stored in UserDefaults.
/// Used as a fast-path so the UI doesn't have to wait on StoreKit at launch.
private let kUnlockedDefaultsKey = "senolop_pro_unlocked"

/// The single non-consumable product ID. Configure this in App Store Connect.
let kSenolopProProductID = "com.senolop.pro.unlock"

/// Observable wrapper around StoreKit 2 — loads products, runs purchase flows,
/// listens for transaction updates, and exposes a simple `isUnlocked` flag the
/// rest of the app can observe.
@MainActor
final class StoreManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var isUnlocked: Bool = UserDefaults.standard.bool(forKey: kUnlockedDefaultsKey)
    @Published var purchaseInFlight: Bool = false
    @Published var lastError: String? = nil

    private var updates: Task<Void, Never>?

    init() {
        // Listen for transactions that arrive outside the explicit purchase flow
        // (renewals, restores from another device, refunds, etc.).
        updates = Task.detached { [weak self] in
            for await result in Transaction.updates {
                if case .verified(let tx) = result {
                    await self?.apply(transaction: tx)
                }
            }
        }
    }

    deinit { updates?.cancel() }

    /// Sample manager preconfigured as "unlocked" for SwiftUI previews.
    static var preview: StoreManager {
        let m = StoreManager()
        m.isUnlocked = true
        return m
    }

    /// Loads product metadata from the App Store. Safe to call multiple times.
    func loadProducts() async {
        do {
            let loaded = try await Product.products(for: [kSenolopProProductID])
            self.products = loaded
        } catch {
            self.lastError = error.localizedDescription
        }
    }

    /// Re-checks current entitlements at launch / on demand.
    func refreshEntitlements() async {
        var unlocked = false
        for await result in Transaction.currentEntitlements {
            if case .verified(let tx) = result, tx.productID == kSenolopProProductID, tx.revocationDate == nil {
                unlocked = true
            }
        }
        setUnlocked(unlocked)
    }

    /// Initiates a purchase. Returns `true` if the user was successfully charged.
    @discardableResult
    func purchase() async -> Bool {
        guard let product = products.first(where: { $0.id == kSenolopProProductID }) else {
            await loadProducts()
            guard let product = products.first(where: { $0.id == kSenolopProProductID }) else {
                self.lastError = NSLocalizedString("paywall.error.product_unavailable",
                                                   value: "Product not available right now. Please try again later.",
                                                   comment: "")
                return false
            }
            return await purchase(product: product)
        }
        return await purchase(product: product)
    }

    private func purchase(product: Product) async -> Bool {
        purchaseInFlight = true
        defer { purchaseInFlight = false }
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                if case .verified(let tx) = verification {
                    await apply(transaction: tx)
                    return true
                }
                self.lastError = NSLocalizedString("paywall.error.unverified",
                                                   value: "Purchase could not be verified.",
                                                   comment: "")
                return false
            case .userCancelled:
                return false
            case .pending:
                return false
            @unknown default:
                return false
            }
        } catch {
            self.lastError = error.localizedDescription
            return false
        }
    }

    /// App Store guideline 3.1.1 requires a Restore Purchases entry-point.
    func restore() async {
        do {
            try await AppStore.sync()
            await refreshEntitlements()
        } catch {
            self.lastError = error.localizedDescription
        }
    }

    private func apply(transaction tx: Transaction) async {
        if tx.productID == kSenolopProProductID && tx.revocationDate == nil {
            setUnlocked(true)
        }
        await tx.finish()
    }

    private func setUnlocked(_ value: Bool) {
        self.isUnlocked = value
        UserDefaults.standard.set(value, forKey: kUnlockedDefaultsKey)
    }
}

struct SubscriptionView: View {
    @EnvironmentObject private var store: StoreManager
    @Environment(\.dismiss) private var dismiss
    var featureName: String = "Senolop Pro"

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Image(systemName: "function")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.accentColor)

                Text("Unlock \(featureName)")
                    .font(.title)
                    .multilineTextAlignment(.center)

                VStack(alignment: .leading, spacing: 12) {
                    Label("Scientific keyboard (sin, cos, log, π, …)", systemImage: "checkmark.circle.fill")
                    Label("Programmer keyboard (AND, OR, XOR, hex …)", systemImage: "checkmark.circle.fill")
                    Label("Calculation history", systemImage: "checkmark.circle.fill")
                    Label("All future Pro features", systemImage: "checkmark.circle.fill")
                }
                .padding()
                .frame(maxWidth: 400)

                if let product = store.products.first(where: { $0.id == kSenolopProProductID }) {
                    Button(action: {
                        Task {
                            if await store.purchase() { dismiss() }
                        }
                    }) {
                        if store.purchaseInFlight {
                            ProgressView().tint(.white)
                        } else {
                            Text("Unlock for \(product.displayPrice)").bold()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(store.purchaseInFlight)
                } else {
                    Button(action: {
                        Task {
                            await store.loadProducts()
                            if await store.purchase() { dismiss() }
                        }
                    }) {
                        if store.purchaseInFlight {
                            ProgressView()
                        } else {
                            Text("Unlock").bold()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(store.purchaseInFlight)
                }

                Button("Restore Purchases") {
                    Task { await store.restore() }
                }
                .font(.footnote)

                if let err = store.lastError {
                    Text(err).font(.caption).foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                HStack(spacing: 16) {
                    Link("Terms",   destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")!)
                    Link("Privacy", destination: URL(string: "https://www.apple.com/legal/privacy/")!)
                }
                .font(.caption2)
                .foregroundColor(.secondary)

                Spacer()
            }
            .padding()
            .navigationTitle("Senolop Pro")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
            .task {
                if store.products.isEmpty { await store.loadProducts() }
                await store.refreshEntitlements()
            }
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
            .environmentObject(StoreManager.preview)
    }
}

