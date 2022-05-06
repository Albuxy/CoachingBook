//
//  LocationService.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 4/5/22.
//

import Foundation
import SwiftUI

class LocalizationService {

    static let shared = LocalizationService()
    static let changedLanguage = Notification.Name("changedLanguage")

    private init() {}
    
    var language: Language {
        get {
            guard let languageString = UserDefaults.standard.string(forKey: "language") else {
                return .english_us
            }
            return Language(rawValue: languageString) ?? .english_us
        } set {
            if newValue != language {
                UserDefaults.standard.setValue(newValue.rawValue, forKey: "language")
                NotificationCenter.default.post(name: LocalizationService.changedLanguage, object: nil)
            }
        }
    }
}

enum Language: String {
    case english_us = "en"
    case spanish = "es"
    case catalan = "ca"
}
