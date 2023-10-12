//
//  PatternView.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 03/10/2023.
//

import SwiftUI

struct PatternView: View {

    @ObservedObject var viewModel = PatternViewModel()

    var body: some View {
        ScrollView {
            HStack {
                Text("Pattern presets")
                    .font(.system(size: 13, weight: .light))
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.leading, 30)
                Spacer()
            }
            PatternItem(viewModel: viewModel)
        }
        .background(Color.appCgreen)
        .navigationBarItems(
            leading:
                BackButton()
        )
    }

}

struct PatternView_Previews: PreviewProvider {
    static var previews: some View {
        PatternView()
    }
}
