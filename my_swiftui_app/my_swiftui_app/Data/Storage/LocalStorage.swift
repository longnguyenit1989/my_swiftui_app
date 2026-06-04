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
}
