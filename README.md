# Senolop — RPN Calculator for iOS & tvOS

**Senolop** is a native [Reverse Polish Notation (RPN)](https://en.wikipedia.org/wiki/Reverse_Polish_notation) calculator built with **SwiftUI**. It provides an intuitive, stack-based interface for performing arithmetic — the way HP calculators made famous.

> *"Senolop"* is *"Polones"* spelled backwards — a nod to Polish notation!

## Features

### Core Calculator
- **Full RPN engine** — enter operands first, then the operator
- **Basic arithmetic** — addition, subtraction, multiplication, and division
- **Stack operations** — duplicate (`Enter`), drop, swap, roll up, and roll down
- **Percentage** and **sign inversion** (`±`) operators
- **Live stack display** — see the entire stack at a glance

### Multiple Keyboard Modes
| Mode | Description |
|------|-------------|
| **Numeric** | Standard 0–9 digits, decimal point, and basic operations |
| **Scientific** | Trigonometric, logarithmic, and power functions *(in development)* |
| **Programmer** | Hexadecimal digits (A–F) and bitwise operations *(in development)* |

### User Experience
- **Haptic feedback** — tactile response on button presses via CoreHaptics (configurable in Settings)
- **Customizable themes** — choose from 6 button color themes (Orange, Mint, Strawberry, Lime, Grape, Mango)
- **Localization** — supports English, Portuguese (Brazil), Spanish, and Polish

## Requirements

| Requirement | Version |
|-------------|---------|
| Xcode | 14.0+ |
| Swift | 5.0+ |
| iOS | 16.0+ |
| tvOS | 16.0+ |

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ssouzawallace/senolop.git
   ```

2. **Open the project in Xcode:**

   ```bash
   cd senolop
   open SenolopApp.xcodeproj
   ```

3. **Select a target** — choose an iOS Simulator or a tvOS Simulator from the device menu.

4. **Build and run** — press <kbd>⌘</kbd><kbd>R</kbd> or click the Play button.

## How RPN Works

In Reverse Polish Notation you enter operands *before* the operator. There are no parentheses — the stack determines the order of operations.

**Example:** To compute `(3 + 4) × 2`:

| Step | Action | Stack (top → bottom) |
|------|--------|---------------------|
| 1 | Enter `3` | `3` |
| 2 | Press `Enter` | `3  3` |
| 3 | Enter `4` | `4  3` |
| 4 | Press `+` | `7` |
| 5 | Enter `2` | `2  7` |
| 6 | Press `×` | `14` |

### Quick Examples

| Expression (infix) | RPN Input | Result |
|--------------------|-----------|--------|
| `5 + 2` | `5 Enter 2 +` | `7` |
| `9 − 3` | `9 Enter 3 −` | `6` |
| `4 × 5` | `4 Enter 5 ×` | `20` |
| `10 ÷ 2` | `10 Enter 2 ÷` | `5` |
| `(4 × 3) ÷ (8 + 2)` | `4 Enter 3 × 8 Enter 2 + ÷` | `1.2` |

### Stack Manipulation

| Button | Action |
|--------|--------|
| **Enter** | Duplicates the top of the stack |
| **Drop** | Removes the top value |
| **Swap** | Swaps the top two values |
| **Roll ↑** | Rotates the stack upward |
| **Roll ↓** | Rotates the stack downward |
| **AC / C** | Clears the stack or the current entry |

## Project Structure

```
senolop/
├── SenolopApp.swift                # App entry point (@main)
├── Typealiases.swift               # Global type aliases
├── Senolop/
│   ├── Calculator/
│   │   ├── RPN.swift               # Core RPN stack engine
│   │   ├── Scientific.swift        # Scientific functions (planned)
│   │   ├── Programmer.swift        # Programmer mode (planned)
│   │   └── CalculatorHapticsFeedbackHandler.swift
│   ├── Shared/SwiftUI/
│   │   ├── ContentView.swift       # Main app view
│   │   ├── Display.swift           # Stack display
│   │   ├── Calculator/             # Calculator protocol & component
│   │   ├── Keyboard/               # Numeric, Scientific, Programmer keyboards
│   │   ├── WelcomeView.swift       # Splash screen
│   │   └── StringResources.swift   # Localized strings
│   └── SenolopTests/               # Unit tests (XCTest)
└── Senolop-tvOS/                   # tvOS-specific target
```

## Architecture

- **Protocol-oriented design** — `CalculatorProtocol` enables multiple calculator implementations
- **Value-type state** — the `RPN` struct uses `mutating` methods for a functional approach
- **SwiftUI bindings** — parent views pass `@Binding` references to child views for reactive state
- **Haptics abstraction** — swappable implementations (Dummy, Default, Real) for testing and production

## Running Tests

Open the project in Xcode and run the test suite:

<kbd>⌘</kbd><kbd>U</kbd>

The test suite covers:
- Digit input and decimal handling
- All four arithmetic operations
- Stack manipulation (swap, roll up, roll down)
- Special operations (percentage, sign inversion, clear)

## Contributing

Contributions are welcome! Here's how to get involved:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m "Add my feature"`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a Pull Request on [GitHub](https://github.com/ssouzawallace/senolop)

### Areas Where Help Is Needed

- 🔬 **Scientific mode** — wire up trigonometric, logarithmic, and power functions
- 💻 **Programmer mode** — implement bitwise operations and hex input
- 🧪 **Test coverage** — expand unit tests for edge cases
- 🌍 **Localization** — improve and add new language translations
- ♿ **Accessibility** — add VoiceOver labels and Dynamic Type support

## Contact

For questions or feedback, reach out to the maintainer at [ssouza.wallace@gmail.com](mailto:ssouza.wallace@gmail.com).
