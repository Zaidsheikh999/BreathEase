//
//  LandingView.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 27/09/2023.
//

import SwiftUI

struct LandingView: View {
    
    
    @State private var circle1Offset: CGFloat = 0
    @State private var circle2Offset: CGFloat = 0
    @State private var circle3Offset: CGFloat = 0
    @State private var circle4Offset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 20) {
            GeometryReader { geometry in
                ZStack {
                    // First Circle at top left corner
                    CircleView(color: .green, shadowColor: .white, opacity: 0.05)
                        .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.1 + circle1Offset)
                    
                    // Second Circle at bottom left corner
                    CircleView(color: .blue, shadowColor: .black, opacity: 0.06)
                        .position(x: geometry.size.width * 0.1, y: geometry.size.height * 1.5 + circle2Offset)
                    
                    // Third Circle at center right
                    CircleView(color: .orange, shadowColor: .black, opacity: 0.05)
                        .position(x: geometry.size.width * 1.2 + circle3Offset, y: geometry.size.height * 0.5)
                    
                    // Forth Circle Bottom right
                    CircleView(color: .black, shadowColor: .black, opacity: 0.07)
                        .position(x: geometry.size.width * 0.9, y: geometry.size.height * 1.9 + circle4Offset)
                }
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true)) {
                        circle1Offset = -25
                        circle2Offset = 60
                        circle3Offset = -30
                        circle4Offset = -30
                    }
                }
            }
            VStack(spacing: 4){
                Text("BreathEase")
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(.black)
                
                
                Text("Relax, focux on your breath, and find your inner peace")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray).opacity(0.6)
                
            }
            
            VStack(spacing: 12){
                
                Button {
                    handleSession()
                } label: {
                    Text("Start a new session")
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 290, height: 25)
                        .padding()
                        .background(Color.lightOrange)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .shadow(color: Color.veryLightGray, radius: 0.7, x: 0, y: 0)
                }
                .buttonStyle(PressableButtonStyle())
                
                
                Text("or")
                    .font(.system(size: 16, weight: .medium))
                
                
                Button {
                    handleCustomization()
                } label: {
                    Text("Customize the experience")
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 290, height: 25)
                        .padding()
                        .background(Color.veryLightGray)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .shadow(color: Color.veryLightGray, radius: 0.7, x: 0, y: 0)
                }
                .buttonStyle(PressableButtonStyle())
                
            }
            Spacer()
            Spacer()
            Spacer()
        }
        .padding()
        .background(Color.clear)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {}) {
            EmptyView()
        })
        .navigationBarBackButtonHidden(true)
    }
    
    func handleSession() {
        // Handle session action
    }
    
    func handleCustomization() {
        // Handle customization action
    }
}

struct CircleView: View {
    var color: Color
    var shadowColor: Color
    var opacity: Double
    var diameter: CGFloat = 300
    
    var body: some View {
        Circle()
            .fill(color)
            .opacity(opacity)
            .frame(width: diameter, height: diameter)
            .shadow(color: shadowColor, radius: 10, x: 0, y: 0)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
        
    }
}

