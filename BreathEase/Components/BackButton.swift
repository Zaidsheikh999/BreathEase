//
//  BackButton.swift
//
//  Created by Zaid Sheikh on 16/12/2022.
//

import SwiftUI

struct BackButton: View {

    @Environment (\.presentationMode) private var presentationMode
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("Back")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 25, height: 44, alignment: .leading)
        })
        .buttonStyle(PressableButtonStyle())
    }
}
