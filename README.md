# Senolop — RPN Calculator for iPhone & iPad

Senolop is a fast, beautiful Reverse Polish Notation (RPN) calculator built natively in SwiftUI. Three keyboards, locale-aware number formatting, haptics, and a calculation history.

## Features

- **Numeric keyboard** (free): basic arithmetic, ±, %, swap, drop, roll, clear.
- **Scientific keyboard** *(Pro)*: √x, x², x³, yˣ, 1/x, x!, ln, log₁₀, eˣ, 10ˣ, sin/cos/tan and hyperbolic variants, π, e, random, switchable Deg/Rad.
- **Programmer keyboard** *(Pro)*: AND, OR, XOR, NOR, left/right shift, 1's & 2's complement, hex digits A–F, FF, 00.
- Persistent calculation history.
- Theme picker (orange, mint, strawberry, lime, grape, mango).
- Configurable display precision (2–15 significant digits).
- Locale-aware decimal separators.
- Haptic feedback (toggleable).
- Onboarding for newcomers to RPN.

## Requirements

- iOS 16 / iPadOS 16 or later
- Xcode 14 or later
- Swift 5.0+

## Building

```sh
xcodebuild -project SenolopApp.xcodeproj \
           -scheme Senolop \
           -destination 'platform=iOS Simulator,name=iPhone 16' \
           clean build
```

## Monetization

Senolop ships with a single non-consumable in-app purchase (`com.senolop.pro.unlock`) that unlocks the Scientific and Programmer keyboards plus calculation history. Configure the matching product in App Store Connect before submitting.

The implementation lives in `Senolop/Shared/SwiftUI/SubscriptionView.swift` (`StoreManager`).

## How RPN works

Reverse Polish Notation places the operator after its operands. To compute `(7 − 2) × 5`:

```
7 ↵ 2 − 5 ×
```

Press a number, push it with `Enter`, then choose an operator that consumes the top of the stack.

## Privacy

Senolop does not collect or transmit any user data. The included `PrivacyInfo.xcprivacy` declares the only system API used (UserDefaults) per Apple's required-reasons API rules.

## Localization

English and Brazilian Portuguese are bundled. Add additional `.lproj/Localizable.strings` files for more languages.

## License

MIT — see `LICENSE`.

## Contact

[ssouza.wallace@gmail.com](mailto:ssouza.wallace@gmail.com)
