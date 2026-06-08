//
//  LanguageManager.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 5/6/26.
//

import SwiftUI
import Combine

final class LanguageManager: ObservableObject {
    @Published var currentLanguage: AppLanguage
    
    init() {
        currentLanguage = LocalStorage.shared.selectedLanguage
    }
    
    var locale: Locale {
        Locale(identifier: currentLanguage.localeIdentifier)
    }
    
    func changeLanguage(to language: AppLanguage) {
        currentLanguage = language
        LocalStorage.shared.selectedLanguage = language
    }
}

enum AppLanguage: String, CaseIterable {
    case english = "en"
    case japanese = "ja"
    
    var localeIdentifier: String {
        rawValue
    }
    
    var displayName: String {
        switch self {
        case .english:
            return "English"
        case .japanese:
            return "日本語"
        }
    }
}
