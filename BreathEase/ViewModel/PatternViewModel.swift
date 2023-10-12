//
//  PatternViewModel.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 03/10/2023.
//

import Foundation

class PatternViewModel: ObservableObject {
    @Published var pattern: [Pattern] = []

    init() {
        self.addData()
    }

    func addData() {
        pattern = patternData
    }

    var patternData = [
        Pattern(id: 0, title: "Awake (6-0-2-0)", description: "Use this technique first thing in the morning for quick burst of energy and alertness", isSelected: true, type: .awake),
        Pattern(id: 1, title: "Deep calm (4-7-8-7)", description: "A natural tranquilizer for the nervous system. Do it at least twice a day", isSelected: false, type: .deepCalm),
        Pattern(id: 3, title: "Pranayama (7-4-8-4)", description: "A main component of yoga, an exercise for physical and mental wellness.", isSelected: false, type: .pranayama),
        Pattern(id: 4, title: "Square (4-4-4-4)", description: "Box breathing, also reffered to as square breathing, can hlep you slow down your breathing and reduce stress.", isSelected: false, type: .square),
        Pattern(id: 5, title: "Ujjayi (7-0-7-0)", description: "Balance influence on the cardiorespiratory system, release feelings of irritaion, and calm the mind and body", isSelected: false, type: .ujjayi)
    ]

}
