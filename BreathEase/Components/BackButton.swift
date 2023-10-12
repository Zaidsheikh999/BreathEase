//
//  BackButton.swift
//  CubixClientApp
//
//  Created by Kashif Khatri on 16/12/2022.
//

import SwiftUI

struct BackButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image("Back") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 25, height: 44, alignment: .leading)
        })
        .buttonStyle(PressableButtonStyle())
    }
}
