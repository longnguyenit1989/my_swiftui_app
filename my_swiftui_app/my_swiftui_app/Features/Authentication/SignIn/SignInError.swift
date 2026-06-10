//
//  SignInError.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import Foundation

enum SignInError: Error {
    case invalidEmail
    case emptyEmail

    var message: String {
        switch self {
        case .invalidEmail:
            return AppStrings.Error.invalidEmail
        case .emptyEmail:
            return AppStrings.Error.emptyEmail
        }
    }
}
