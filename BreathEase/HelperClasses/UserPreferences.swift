//
//  UserPreferences.swift
//  BreathEase
//
//  Created by Zaid Sheikh on 28/09/2023.
//

import Foundation
import SwiftUI

class UserPreferences {

    class var timer: Int? {
        get {
            let userDefaults: UserDefaults = UserDefaults.standard

            if let timer: Int = userDefaults.object(forKey: "timer") as? Int {
                return timer
            }
            return 1
        }
        set {
            let userDefaults: UserDefaults = UserDefaults.standard
            userDefaults.setValue(newValue, forKey: "timer")
            userDefaults.synchronize()
        }
    }

    class var isVibrate: Bool? {
        get {
            let userDefaults: UserDefaults = UserDefaults.standard

            if let timer: Bool = userDefaults.object(forKey: "isVibrate") as? Bool {
                return timer
            }
            return false
        }
        set {
            let userDefaults: UserDefaults = UserDefaults.standard
            userDefaults.setValue(newValue, forKey: "isVibrate")
            userDefaults.synchronize()
        }
    }

    class var patternSelected: String? {
        get {
            let userDefaults: UserDefaults = UserDefaults.standard

            if let patternSelected: String = userDefaults.object(forKey: "patternSelected") as? String {
                return patternSelected
            }
            return "awake"
        }
        set {
            let userDefaults: UserDefaults = UserDefaults.standard
            userDefaults.setValue(newValue, forKey: "patternSelected")
            userDefaults.synchronize()
        }
    }

    class var patternTitle: String? {
        get {
            let userDefaults: UserDefaults = UserDefaults.standard

            if let patternTitle: String = userDefaults.object(forKey: "patternTitle") as? String {
                return patternTitle
            }
            return "Awake (6-0-2-0)"
        }
        set {
            let userDefaults: UserDefaults = UserDefaults.standard
            userDefaults.setValue(newValue, forKey: "patternTitle")
            userDefaults.synchronize()
        }
    }

    class var patternSelectedIndex: Int? {
        get {
            let userDefaults: UserDefaults = UserDefaults.standard

            if let patternSelectedIndex: Int = userDefaults.object(forKey: "patternSelectedIndex") as? Int {
                return patternSelectedIndex
            }
            return 0
        }
        set {
            let userDefaults: UserDefaults = UserDefaults.standard
            userDefaults.setValue(newValue, forKey: "patternSelectedIndex")
            userDefaults.synchronize()
        }
    }

    class var inhaleTime: Int? {
        get {
            let userDefaults: UserDefaults = UserDefaults.standard

            if let inhaleTime: Int = userDefaults.object(forKey: "inhaleTime") as? Int {
                return inhaleTime
            }
            return 4
        }
        set {
            let userDefaults: UserDefaults = UserDefaults.standard
            userDefaults.setValue(newValue, forKey: "inhaleTime")
            userDefaults.synchronize()
        }
    }

    class var holdTime: Int? {
        get {
            let userDefaults: UserDefaults = UserDefaults.standard

            if let holdTime: Int = userDefaults.object(forKey: "holdTime") as? Int {
                return holdTime
            }
            return 4
        }
        set {
            let userDefaults: UserDefaults = UserDefaults.standard
            userDefaults.setValue(newValue, forKey: "holdTime")
            userDefaults.synchronize()
        }
    }

    class var exhaleTime: Int? {
        get {
            let userDefaults: UserDefaults = UserDefaults.standard

            if let exhaleTime: Int = userDefaults.object(forKey: "exhaleTime") as? Int {
                return exhaleTime
            }
            return 4
        }
        set {
            let userDefaults: UserDefaults = UserDefaults.standard
            userDefaults.setValue(newValue, forKey: "exhaleTime")
            userDefaults.synchronize()
        }
    }
}
