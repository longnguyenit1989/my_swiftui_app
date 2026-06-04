//
//  SessionManager.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import Foundation
import Combine

@MainActor
final class SessionManager: ObservableObject {
    @Published var isAuthenticated: Bool

    init() {
        isAuthenticated =
            KeychainStorage.shared.accessToken != nil
    }

    func login(
        email: String,
        accessToken: String = ""
    ) {
        KeychainStorage.shared.accessToken = accessToken
        KeychainStorage.shared.email = email

        isAuthenticated = true
    }

    func logout() {
        KeychainStorage.shared.clearAll()
        isAuthenticated = false
    }
}
