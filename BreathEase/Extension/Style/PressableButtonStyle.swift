//
//  PressableButtonStyle.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 27/09/2023.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            
    }
    
}
