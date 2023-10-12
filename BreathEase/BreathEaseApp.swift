//
//  BreathEaseApp.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 27/09/2023.
//

import SwiftUI

@main
struct BreathEaseApp: App {

    @State var isActive: Bool = false

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(Color.appDarkCgreen)]  // Change to your desired color

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.appCgreen) // Change to your desired color

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if self.isActive {
                    withAnimation {
                        LandingView()
                    }
                } else {
                    SplashView()
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }

        }
    }
}
