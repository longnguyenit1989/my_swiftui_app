//
//  AppStrings.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 2/6/26.
//

import Foundation
enum AppStrings {
    enum Main {
        static let home = String(localized: "main.home")
        static let search = String(localized: "main.search")
        static let favourite = String(localized: "main.favourite")
        static let profile = String(localized: "main.profile")
    }
    
    enum Error {
        static let invalidEmail = String(localized: "error.invalid_email")
        static let emptyEmail = String(localized: "error.empty_email")
        static let signInError = String(localized: "sign_in.error")
        static let wrongOTP = String(localized: "error.wrong_otp")
        static let insufficientOTP = String(localized: "error.insufficient_otp")
        static let verifyOTPError = String(localized: "verify_otp_error")
    }
    
    enum Common {
        static let ok = String(localized: "ok")
    }
    
    enum SignIn {
        static let sendCode = String(localized: "sign_in.send_code")
        static let emailPlaceholder = String(localized: "sign_in.email")
    }
    
    enum VerifyOtp {
        static let title = String(localized: "verify_otp.title")
        static let enterVerificationCode = String(localized: "verify_otp_enter_verification_code")
        static let verify = String(localized: "verify")
        static let resendCode = String(localized: "verify_resend_code")
        static let changeVerificationEmail = String(localized: "verify_change_verification_email")
    }
    
    enum Profile {
        static let logout = String(localized: "profile.logout")
        static let editAccount = String(localized: "profile.editAccount")
        static let editProfile = String(localized: "profile.editProfile")
        static let deleteAccount = String(localized: "profile.deleteAccount")
    }
}
