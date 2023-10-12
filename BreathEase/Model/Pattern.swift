//
//  Pattern.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 03/10/2023.
//

import Foundation

struct Pattern: Identifiable, Hashable {
    var id: Int
    var title: String
    var description: String
    var isSelected: Bool
    var type: MoreType

    enum MoreType: Hashable {
        case awake
        case deepCalm
        case pranayama
        case square
        case ujjayi
    }
}
