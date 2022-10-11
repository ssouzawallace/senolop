//
//  HapticsHelper.swift
//  Senolop
//
//  Created by Wallace Silva on 11/10/22.
//

import Foundation
import CoreHaptics

struct HapticsHelper {
    private var hapticEngine: CHHapticEngine?
    
    public static var sharedInstance =  HapticsHelper()
    
    init() {
        do {
            hapticEngine = try CHHapticEngine()
            hapticEngine?.notifyWhenPlayersFinished { (_) -> CHHapticEngine.FinishedAction in return .leaveEngineRunning }
            hapticEngine?.resetHandler = hapticEngineDidRecoverFromServerError
            hapticEngine?.stoppedHandler = hapticEngineDidStop
        } catch {
            print(error)
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
    
    func shake() {
        // TODO: shake gesture vibration
    }
    
    func tap() {
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
}
