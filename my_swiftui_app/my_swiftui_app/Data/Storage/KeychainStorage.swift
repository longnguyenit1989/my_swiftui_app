//
//  KeychainStorage.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import Foundation
import Security

final class KeychainStorage {
    
    static let shared = KeychainStorage()
    
    private init() {}
    
    // MARK: - Public Properties
    
    var accessToken: String? {
        get { getValue(for: Keys.accessToken) }
        set { setValue(newValue, for: Keys.accessToken) }
    }
    
    var refreshToken: String? {
        get { getValue(for: Keys.refreshToken) }
        set { setValue(newValue, for: Keys.refreshToken) }
    }
    
    var email: String? {
        get { getValue(for: Keys.email) }
        set { setValue(newValue, for: Keys.email) }
    }
        
    private enum Keys {
        static let accessToken = "access_token"
        static let refreshToken = "refresh_token"
        static let email = "email"
    }
    
    private func setValue(
        _ value: String?,
        for key: String
    ) {
        if let value {
            save(
                value,
                for: key
            )
        } else {
            delete(
                for: key
            )
        }
    }
    
    private func save(_ value: String, for key: String) {
        guard let data = value.data(using: .utf8) else {
            return
        }
        
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let attributes: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ]
        
        SecItemAdd(
            attributes as CFDictionary,
            nil
        )
    }
    
    private func getValue(
        for key: String
    ) -> String? {
        
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        
        let status = SecItemCopyMatching(
            query as CFDictionary,
            &result
        )
        
        guard
            status == errSecSuccess,
            let data = result as? Data
        else {
            return nil
        }
        
        return String(
            data: data,
            encoding: .utf8
        )
    }
    
    private func delete(
        for key: String
    ) {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        
        SecItemDelete(query as CFDictionary)
    }
    
    func clearAll() {
        accessToken = nil
        refreshToken = nil
        email = nil
    }
}
