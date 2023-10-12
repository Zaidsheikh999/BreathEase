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
                .fill(configuration.isOn ? Color.indigo : Color.white)
                .frame(width: 50, height: 30, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.indigo, lineWidth: 1)
                )
                .overlay(
                    Circle()
                        .fill(configuration.isOn ? Color.white : Color.indigo)
                        .padding(2)
                        .offset(x: configuration.isOn ? 10 : -10)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
                .animation(.easeInOut, value: configuration.isOn)
        }
    }
}
