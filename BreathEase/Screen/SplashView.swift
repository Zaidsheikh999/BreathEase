//
//  SplashView.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 28/09/2023.
//

import SwiftUI

struct SplashView: View {

    var body: some View {
        VStack {

            Spacer()
            Spacer()
            Spacer()
            Spacer()

            HStack(spacing: 2) {
                Text("Breath")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(.white)

                Text("Ease")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.appDarkCgreen)
                    .italic()

                Spacer()
            }
            .padding()
        }
        .background(Color.appCgreen)
        .navigationBarHidden(true)
        .navigationBarItems(leading: Button(action: {}) {
            EmptyView()
        })
        .navigationBarBackButtonHidden(true)

    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
