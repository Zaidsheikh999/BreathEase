//
//  PatternItem.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 03/10/2023.
//

import SwiftUI

struct PatternItem: View {

    @ObservedObject var viewModel = PatternViewModel()

    @State var selectedItemId: Int = 0

    var body: some View {
        ForEach(viewModel.pattern) { item in
            VStack(spacing: 25) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(item.title)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor((selectedItemId == item.id) ? .appLightCgreen : .black)
                            .padding(.top, 10)

                        Text(item.description)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
                Rectangle()
                    .fill(Color.appDarkCgreen)
                    .frame(height: 1)
                    .edgesIgnoringSafeArea(.horizontal)
            }
            .background(Color.appCgreen)
            .onTapGesture {
                print(item.title, "tapped!")
                isSeleted(option: item)
                patternTime(option: item)
            }
            .onAppear {
                self.selectedItemId = UserPreferences.patternSelectedIndex!
            }
        }
    }

    func isSeleted(option: Pattern) {
        if option.type == .awake {
            UserPreferences.patternSelected = "awake"
            UserPreferences.patternTitle = "Awake (6-0-2-0)"
            self.selectedItemId = option.id
            UserPreferences.patternSelectedIndex = option.id
        } else if option.type == .deepCalm {
            UserPreferences.patternSelected = "deepCalm"
            UserPreferences.patternTitle = "Deep calm (4-7-8-7)"
            self.selectedItemId = option.id
            UserPreferences.patternSelectedIndex = option.id
        } else if option.type == .pranayama {
            UserPreferences.patternSelected = "pranayama"
            UserPreferences.patternTitle = "Pranayama (7-4-8-4)"
            self.selectedItemId = option.id
            UserPreferences.patternSelectedIndex = option.id
        } else if option.type == .square {
            UserPreferences.patternSelected = "square"
            UserPreferences.patternTitle = "Square (4-4-4-4)"
            self.selectedItemId = option.id
            UserPreferences.patternSelectedIndex = option.id
        } else if option.type == .ujjayi {
            UserPreferences.patternSelected = "ujjayi"
            UserPreferences.patternTitle = "Ujjayi (7-0-7-0)"
            self.selectedItemId = option.id
            UserPreferences.patternSelectedIndex = option.id
        }
    }

    func patternTime(option: Pattern) {
        if option.type == .awake {
            UserPreferences.inhaleTime = 6
            UserPreferences.holdTime = 0
            UserPreferences.exhaleTime = 2
        } else if option.type == .deepCalm {
            UserPreferences.inhaleTime = 4
            UserPreferences.holdTime = 7
            UserPreferences.exhaleTime = 8
        } else if option.type == .pranayama {
            UserPreferences.inhaleTime = 7
            UserPreferences.holdTime = 4
            UserPreferences.exhaleTime = 8
        } else if option.type == .square {
            UserPreferences.inhaleTime = 4
            UserPreferences.holdTime = 4
            UserPreferences.exhaleTime = 4
        } else if option.type == .ujjayi {
            UserPreferences.inhaleTime = 7
            UserPreferences.holdTime = 0
            UserPreferences.exhaleTime = 7
        }
    }

}

// struct PatternItem_Previews: PreviewProvider {
//    static var previews: some View {
//        PatternItem()
//    }
// }
