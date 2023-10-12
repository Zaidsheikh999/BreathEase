//
//  BreathingExerciseViewModel.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 04/10/2023.
//

import Foundation
import UIKit

class BreathingExerciseViewModel: ObservableObject {
    
    @Published var scale: CGFloat = 0.5
    @Published var phase: String = "Inhale"
    @Published var timeRemaining: Int = 0
    @Published var startCountdown: Int?

    @Published var animationBlock: Bool = false
    @Published var phaseBlock: Bool = false

    @Published var exerciseTimer: Int = UserPreferences.timer! * 60

    @Published var breathingStart: Bool = false

    @Published var complete: Bool = false

    var timer: Timer?
    var breathingTimer: Timer?

    func initiateCountdown() {
        startCountdown = 3
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.startCountdown! > 0 {
                self.startCountdown! -= 1
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.startCountdown = nil
                    self.startBreathingExercise()
                }
            }
        }
    }

    func startBreathingExercise() {
        animationBlock = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            phaseBlock = true
            breathingStart = true
            inhale()

            self.breathingTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        }
    }
    @objc func updateTimer() {
        exerciseTimer -= 1

        if exerciseTimer >= 1 {
            //                timerlbl.text = timeString
        } else {
            stopBreathingExercise()
        }

    }

    func inhale() {
        UserPreferences.isVibrate! ? triggerImpactFeedback() : nil
        phase = "Inhale"
        scale = 1.5
        timeRemaining = UserPreferences.inhaleTime!
        setupTimer(for: TimeInterval(UserPreferences.inhaleTime!), action: holdAfterInhale)
    }

    func holdAfterInhale() {
        UserPreferences.isVibrate! ? triggerImpactFeedback() : nil
        phase = "Hold"
        timeRemaining = UserPreferences.holdTime!
        setupTimer(for: TimeInterval(UserPreferences.holdTime!), action: exhale)
    }

    func exhale() {
        UserPreferences.isVibrate! ? triggerImpactFeedback() : nil
        phase = "Exhale"
        scale = 0.7
        timeRemaining = UserPreferences.exhaleTime!
        setupTimer(for: TimeInterval(UserPreferences.exhaleTime!), action: holdAfterExhale)
    }

    func holdAfterExhale() {
        UserPreferences.isVibrate! ? triggerImpactFeedback() : nil
        phase = "Hold"
        timeRemaining = UserPreferences.holdTime!
        setupTimer(for: TimeInterval(UserPreferences.holdTime!), action: inhale)
    }

    private func setupTimer(for duration: TimeInterval, action: @escaping () -> Void) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                action()
            }
        }
    }
    func stopBreathingExercise() {
        timer?.invalidate()
        timer = nil
        self.breathingTimer?.invalidate()
        self.breathingTimer = nil
        timeRemaining = 0
        scale = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) { [self] in
            animationBlock = false
        }
        phaseBlock = false
        complete = true
        breathingStart = false
    }

    func triggerImpactFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .rigid)
        generator.prepare()
        generator.impactOccurred()
        print("Vibrate")
    }
}
