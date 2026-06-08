//
//  LocalStorage.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import Foundation

final class LocalStorage {
    static let shared = LocalStorage()
    
    private init() {}
    
    var isVerified: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaultsKeys.isVerified)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.isVerified)
        }
    }
    
    var selectedLanguage: AppLanguage {
        get {
            AppLanguage(
                rawValue: UserDefaults.standard.string(
                    forKey: UserDefaultsKeys.selectedLanguage
                ) ?? ""
            ) ?? .english
        }
        set {
            UserDefaults.standard.set(
                newValue.rawValue,
                forKey: UserDefaultsKeys.selectedLanguage
            )
        }
    }
}
