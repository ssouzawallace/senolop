//
//  CalculatorHapticsFeedbackHandler.swift
//  Senolop
//
//  Created by Wallace Silva on 13/04/23.
//

import Foundation
import CoreHaptics
import SwiftUI

protocol CalculatorHapticsFeedbackHandler {
    func bip()
    func blink()
}

struct DummyCalculatorHapticsFeedbackHandler: CalculatorHapticsFeedbackHandler {
    var debug = false
    func bip() {
        if debug {
            print("bip")
        }
    }
    func blink() {
        if debug {
            print("blink")
        }
    }
}

class CalculatorHapticsFeedbackHandlerImpl: CalculatorHapticsFeedbackHandler {
    @AppStorage("sound_haptics_feedback_enabled_preference")
    private var soundHapticsFeedbackEnabledPreference = true
    
    var supportsHaptics: Bool = false
    var engine: CHHapticEngine?

    init() {
        let hapticCapability = CHHapticEngine.capabilitiesForHardware()
        supportsHaptics = hapticCapability.supportsHaptics
        
        guard supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
        } catch let error {
            fatalError("Engine Creation Error: \(error)")
        }
        
        engine?.resetHandler = { [weak self] in
            
            print("Reset Handler: Restarting the engine.")
            
            do {
                try self?.engine?.start()
            } catch {
                fatalError("Failed to restart the engine: \(error)")
            }
        }
        
        engine?.stoppedHandler = { reason in
            print("Stop Handler: The engine stopped for reason: \(reason.rawValue)")
            switch reason {
            case .audioSessionInterrupt: print("Audio session interrupt")
            case .applicationSuspended: print("Application suspended")
            case .idleTimeout: print("Idle timeout")
            case .systemError: print("System error")
            case .notifyWhenFinished: print("Notify when finished")
            case .engineDestroyed: print("Engine destroyed")
            case .gameControllerDisconnect: print("Game controller disconnect")
            @unknown default:
                print("Unknown error")
            }
        }
    }
    
    func bip() {
        let hapticDict = [
            CHHapticPattern.Key.pattern: [
                [CHHapticPattern.Key.event: [
                    CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticTransient,
                    CHHapticPattern.Key.time: CHHapticTimeImmediate,
                    CHHapticPattern.Key.eventDuration: 1.0] as [CHHapticPattern.Key : Any]
                ]
            ]
        ]
        play(hapticDict)
    }
    
    func blink() {
        let hapticDict = [
            CHHapticPattern.Key.pattern: [
                [CHHapticPattern.Key.event: [
                    CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticTransient,
                    CHHapticPattern.Key.time: CHHapticTimeImmediate,
                    CHHapticPattern.Key.eventDuration: 0.5] as [CHHapticPattern.Key : Any]
                ],
                [CHHapticPattern.Key.event: [
                    CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticTransient,
                    CHHapticPattern.Key.time: 0.25,
                    CHHapticPattern.Key.eventDuration: 1.0]
                ]
            ]
        ]
        play(hapticDict)
    }
    
    private func play (_ hapticDict: [CHHapticPattern.Key: Any]) {
        do {
            let pattern = try CHHapticPattern(dictionary: hapticDict)
            let player = try engine?.makePlayer(with: pattern)
            player?.isMuted = !soundHapticsFeedbackEnabledPreference
            engine?.notifyWhenPlayersFinished { error in
                return .stopEngine
            }

            try engine?.start()
            try player?.start(atTime: 0)
        } catch {
            fatalError("Failed to play the haptic pattern: \(error)")
        }
    }
}
