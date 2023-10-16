//
//  ColoredToggleStyle.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 28/09/2023.
//

import Foundation
import SwiftUI

struct ColoredToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label

            Spacer()

            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(configuration.isOn ? Color.appDarkCgreen : Color.white)
                .frame(width: 50, height: 30, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.appDarkCgreen, lineWidth: 1)
                )
                .overlay(
                    Circle()
                        .fill(configuration.isOn ? Color.white : Color.appDarkCgreen)
                        .padding(2)
                        .offset(x: configuration.isOn ? 10 : -10)
                )
                .animation(.spring(response: 0.5, dampingFraction: 0.4))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.5)){
                        configuration.isOn.toggle()
                    }
                }
                .animation(.easeInOut, value: configuration.isOn)
        }
    }
}
