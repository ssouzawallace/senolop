//
//  Typealiases.swift
//  Senolop
//
//  Created by Wallace Souza Silva on 26/05/24.
//

import Foundation

struct Item: Identifiable, Equatable {
    var value: String
    let id = UUID()

    /// Numeric interpretation of this item, accepting both `.` and `,` decimal separators.
    var doubleValue: Double? {
        Double(value.replacingOccurrences(of: ",", with: "."))
    }

    /// Pretty, locale-aware display string. Trims trailing zeros and uses
    /// significant-digit precision configured by the user.
    func display(precision: Int = 10, locale: Locale = .current) -> String {
        guard let d = doubleValue else { return value }
        if d.isNaN { return "NaN" }
        if d.isInfinite { return d > 0 ? "∞" : "-∞" }

        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = false
        formatter.maximumSignificantDigits = max(1, min(precision, 15))
        formatter.minimumSignificantDigits = 1
        // If the user is mid-entry (raw string contains decimal but no value yet)
        // preserve that so they can keep typing.
        let raw = value
        if raw.hasSuffix(".") || raw.hasSuffix(",") {
            return raw.replacingOccurrences(of: ".", with: locale.decimalSeparator ?? ".")
        }
        return formatter.string(from: NSNumber(value: d)) ?? raw
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id && lhs.value == rhs.value
    }
}

