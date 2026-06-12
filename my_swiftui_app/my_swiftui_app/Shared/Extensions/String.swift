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
}
