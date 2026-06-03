//
//  AppStrings.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 2/6/26.
//

import Foundation
enum AppStrings {
    enum Error {
        static let invalidEmail = String(localized: "error.invalid_email")
        static let emptyEmail = String(localized: "error.empty_email")
    }
    
    enum Common {
        static let ok = String(localized: "ok")
    }
    
    enum SignIn {
        static let sendCode = String(localized: "sign_in.send_code")
        static let emailPlaceholder = String(localized: "sign_in.email")
        static let signInError = String(localized: "sign_in.error")
    }
    
    enum VerifyOtp {
        static let title = String(localized: "verify_otp.title")
        static let enterVerificationCode = String(localized: "verify_otp_enter_verification_code")
        static let verify = String(localized: "verify")
        static let resendCode = String(localized: "verify_resend_code")
        static let changeVerificationEmail = String(localized: "verify_change_verification_email")
    }
}
