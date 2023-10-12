//
//  CustomizeView.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 28/09/2023.
//

import SwiftUI

struct CustomizeView: View {

    @State private var patternScreen: Bool = false

    @State private var isOn: Bool = false

    @State private var timer: Int = 1

    @State private var patternTitle: String = ""

    var body: some View {

        ScrollView {

            VStack(spacing: 25) {

                // Breathing Pattern
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Breathing Pattern")
                            .font(.system(size: 13, weight: .light))
                            .foregroundColor(.white)

                        Text("Pattern")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.top, 10)

                        Text(patternTitle)
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
                .onTapGesture {
                    self.patternScreen = true
                }

                Rectangle()
                    .fill(Color.appDarkCgreen)
                    .frame(height: 1)
                    .edgesIgnoringSafeArea(.horizontal)

                // Haptics
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Haptics")
                            .font(.system(size: 13, weight: .light))
                            .foregroundColor(.white)

                        Text("Vibration")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.top, 10)

                        Text("Vibrate on the step change")
                            .lineLimit(1)
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(.white)

                    }
                    .padding(.leading, 30)

                    Toggle("", isOn: $isOn)
                        .toggleStyle(ColoredToggleStyle())
                        .padding(.trailing, 10)
                }

                Rectangle()
                    .fill(Color.appDarkCgreen)
                    .frame(height: 1)
                    .edgesIgnoringSafeArea(.horizontal)

                // Timer

                HStack(spacing: 10) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Timer")
                            .font(.system(size: 13, weight: .light))
                            .foregroundColor(.white)

                        Text("Exercise timer")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.top, 10)

                        Text("Time limit in minutes")
                            .lineLimit(1)
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(.white)

                    }
                    .padding(.leading, 30)

                    Spacer()

                    HStack(spacing: 10) {
                        Button("-") {
                            self.timer -= 1
                            UserPreferences.timer = self.timer
                        }
                        .disabled(timer == 1)
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 45, height: 25)
                        .background(Color.appDarkCgreen)
                        .cornerRadius(7)
                        .foregroundColor(.white)
                        .shadow(color: Color.black, radius: 0.7, x: 0, y: 0)
                        .buttonStyle(PressableButtonStyle())

                        Text("\(UserPreferences.timer!)")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)

                        Button("+") {
                            self.timer += 1
                            UserPreferences.timer = self.timer
                        }
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 45, height: 25)
                        .background(Color.appDarkCgreen)
                        .cornerRadius(7)
                        .foregroundColor(.white)
                        .shadow(color: Color.black, radius: 0.7, x: 0, y: 0)
                        .buttonStyle(PressableButtonStyle())

                    }
                    .padding(.trailing, 10)

                }

                // MARK: - Navigate to Pattern Screen
                NavigationLink(destination: PatternView()
                                .navigationTitle("Patterns")
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationBarBackButtonHidden(true), isActive: $patternScreen) {
                    EmptyView()
                }

            }
            .padding(.top, 20)
            .navigationBarItems(
                leading:
                    BackButton()
            )
        }
        .navigationBarColor(UIColor(Color.appCgreen))
        .background(Color.appCgreen)
        .onAppear {
            self.timer = UserPreferences.timer!
            self.isOn = UserPreferences.isVibrate!
            self.patternTitle = UserPreferences.patternTitle!
        }

        .onDisappear {
            UserPreferences.isVibrate = self.isOn
        }

    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView()
    }
}

// Custom View Modifier to set the navigation bar color
struct NavigationBarColorModifier: ViewModifier {
    let backgroundColor: UIColor?

    init(backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    func body(content: Content) -> some View {
        content
    }
}

// Extension on View to apply the custom navigation bar color modifier
extension View {
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarColorModifier(backgroundColor: backgroundColor))
    }
}
