//
//  MyButton.swift
//  Senolop
//
//  Created by Wallace Silva on 08/10/22.
//

import SwiftUI
import CoreHaptics

struct CalculatorButton: View {
    let action: () -> Void
    let labelContent: String
    
    private var hapticEngine: CHHapticEngine? {
        didSet {
            guard let hapticEngine: CHHapticEngine = hapticEngine else { return }
            hapticEngine.playsHapticsOnly = true
            hapticEngine.isAutoShutdownEnabled = false
            hapticEngine.notifyWhenPlayersFinished { (_) -> CHHapticEngine.FinishedAction in return .leaveEngineRunning }
            hapticEngine.stoppedHandler = hapticEngineDidStop
            hapticEngine.resetHandler = hapticEngineDidRecoverFromServerError
        }
    }
    
    /// Called when the haptic engine fails. Will attempt to restart the haptic engine.
    private func hapticEngineDidRecoverFromServerError() {
        print("\(#function)")
        try? hapticEngine?.start()
    }
    
    /// Called when the haptic engine stops due to an external reason.
    private func hapticEngineDidStop(reason: CHHapticEngine.StoppedReason) {
        print("\(#function) -> reason: \(reason)")
    }
    
    /// Creates a button that displays a custom label.
    ///
    /// - Parameters:
    ///   - action: The action to perform when the user triggers the button.
    ///   - label: A view that describes the purpose of the button's `action`.
    public init(action: @escaping () -> Void, labelContent: String) {
        self.action = action
        self.labelContent = labelContent
    }
    
    func performAction() {
        action()
        let hapticDict = [
            CHHapticPattern.Key.pattern: [
                [CHHapticPattern.Key.event: [
                    CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticTransient,
                    CHHapticPattern.Key.time: CHHapticTimeImmediate,
                    CHHapticPattern.Key.eventDuration: 1.0]
                ]
            ]
        ]
        do {
            let pattern = try CHHapticPattern(dictionary: hapticDict)
            let player = try hapticEngine?.makePlayer(with: pattern)
            try hapticEngine?.start()
            try player?.start(atTime: 0)
        } catch {
            print(error)
        }
    }
    
    var attributedContent: AttributedString {
        AttributedString(labelContent)
    }
    
    var body: some View {
        Button(action: {
            performAction()
        }, label: {
            Text(attributedContent)
                .padding()
                .lineLimit(1)
                .frame(maxWidth: .infinity)
        })
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(action: {
            /* do nothing */
        }, labelContent: "0")
    }
}
