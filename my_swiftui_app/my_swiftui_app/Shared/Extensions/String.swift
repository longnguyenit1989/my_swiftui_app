//
//  String.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import Foundation
import SwiftUI

extension String {
    var isValidEmail: Bool {
        let pattern = #"^\S+@\S+\.\S+$"#
        return self.range(of: pattern, options: .regularExpression) != nil
    }

    var l10n: LocalizedStringKey {
        LocalizedStringKey(self)
    }

    var localized: String {
        String(localized: String.LocalizationValue(self))
    }

    func localized(locale: Locale) -> String {
        let langCode = locale.identifier
            .components(separatedBy: CharacterSet(charactersIn: "-_"))
            .first ?? AppLanguage.english.localeIdentifier
        if let path = Bundle.main.path(forResource: langCode, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: nil)
        }
        return self.localized
    }

    func localizedFormat(_ args: CVarArg...) -> String {
        String(format: self.localized, arguments: args)
    }
    
    func matches(_ keyword: String) -> Bool {
        self.localizedCaseInsensitiveContains(keyword)
    }
}
