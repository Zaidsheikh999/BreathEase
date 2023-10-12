//
//  SessionView.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 04/10/2023.
//
import SwiftUI

struct SessionView: View {

    @Environment (\.presentationMode) private var presentationMode

    @StateObject private var viewModel = BreathingExerciseViewModel()

    @State private var isAnimating: Bool = false
    @State private var isComplete: Bool = false

    let totalTimeInSeconds = 135

    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            ZStack {
                // Breathing Circle with Color Transition
                if viewModel.animationBlock {
                    Circle()
                        .fill(Color.appDarkCgreen)
                        .blur(radius: 5)
                        .scaleEffect(viewModel.scale)
                        .animation(.easeInOut(duration: Double(viewModel.timeRemaining)), value: viewModel.scale)
                        .animation(.linear(duration: Double(viewModel.timeRemaining)), value: breathingCircleColor(phase: viewModel.phase))
                        .opacity(isAnimating ? 1.0 : 0.0)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 2.5)) {
                                isAnimating = true
                            }
                        }

                    Circle()
                        .fill(Color.white)
                        .blur(radius: 3)
                        .scaleEffect(viewModel.scale)
                        .animation(.easeInOut(duration: Double(viewModel.timeRemaining)), value: viewModel.scale)
                        .animation(.linear(duration: Double(viewModel.timeRemaining)), value: breathingCircleColor(phase: viewModel.phase))
                        .opacity(isAnimating ? 1.0 : 0.0)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 2.5)) {
                                isAnimating = true
                            }
                        }
                    Circle()
                        .fill(Color.appDarkCgreen)
                        .blur(radius: 5)
                        .scaleEffect(viewModel.scale)
                        .animation(.easeInOut(duration: Double(viewModel.timeRemaining)), value: viewModel.scale)
                        .animation(.linear(duration: Double(viewModel.timeRemaining)), value: breathingCircleColor(phase: viewModel.phase))
                        .opacity(isAnimating ? 1.0 : 0.0)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 2.5)) {
                                isAnimating = true
                            }
                        }

                    // Pulsating Glow
                    Circle()
                        .stroke(lineWidth: 6)
                        .fill(pulsatingColor(phase: viewModel.phase))
                        .blur(radius: 2)
                        .scaleEffect(viewModel.scale + 0.3)
                        .animation(.easeInOut(duration: Double(viewModel.timeRemaining)), value: viewModel.scale)
                        .animation(.linear(duration: Double(viewModel.timeRemaining)), value: pulsatingColor(phase: viewModel.phase))
                        .opacity(isAnimating ? 1.0 : 0.0)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 2.5)) {
                                isAnimating = true
                            }
                        }

                }
                if viewModel.complete {
                    Text("Complete")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                        .opacity(isComplete ? 1.0 : 0.3)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 4)) {
                                isComplete = true
                            }
                        }

                }

                // Countdown & Phases
                if let countdownValue = viewModel.startCountdown {
                    Text(countdownValue > 0 ? "\(countdownValue)" : "Start")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }

            }
            .background(Color.appCgreen)
            .frame(width: 400, height: 200)

            Spacer()
            VStack(spacing: 20) {
                if viewModel.phaseBlock {
                    VStack {
                        Text(viewModel.phase)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("\(viewModel.timeRemaining)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }

                Button(action: {
                    viewModel.stopBreathingExercise()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("X")
                        .font(.system(size: 24, weight: .heavy))
                        .foregroundColor(.white)
                        .padding(15)
                        .background(
                            Circle()
                                .stroke(Color.appDarkCgreen, lineWidth: 3)
                                .padding(-20)
                        )
                }
            }
            .background(Color.appCgreen)
        }
        .padding()
        .background(Color.appCgreen)
        .navigationBarColor(UIColor(Color.appCgreen))
        .navigationBarHidden(false)
        .toolbar {
            if viewModel.breathingStart {
                ToolbarItem(placement: .principal) {
                    TimeFormatView(totalSeconds: viewModel.exerciseTimer)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    if viewModel.timer == nil {
                        viewModel.initiateCountdown()
                    } else {
                        viewModel.stopBreathingExercise()
                    }
                }
            }
        }
    }

    func breathingCircleColor(phase: String) -> Color {
        if phase == "Inhale"{
            return Color.indigo.opacity(0.3)
        } else if phase == "Hold" {
            return Color.indigo.opacity(0.3)
        } else if phase == "Exhale" {
            return Color.indigo.opacity(0.7)
        }
        return Color.indigo.opacity(0.3)
    }

    func pulsatingColor(phase: String) -> Color {
        if phase == "Inhale"{
            return Color.appDarkCgreen.opacity(0.7)
        } else if phase == "Hold" {
            return Color.appDarkCgreen.opacity(0.5)
        } else if phase == "Exhale" {
            return Color.appDarkCgreen.opacity(0.3)
        }
        return Color.appDarkCgreen.opacity(0.7)
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
            .background(Color.appCgreen)
    }
}

struct TimeFormatView: View {
    let totalSeconds: Int

    var body: some View {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60

        return Text(String(format: "%02d:%02d", minutes, seconds))
            .font(.system(size: 16, weight: .black))
            .foregroundColor(.white)
    }
}
