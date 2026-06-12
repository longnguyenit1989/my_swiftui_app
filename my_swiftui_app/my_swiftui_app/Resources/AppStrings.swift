//
//  AppStrings.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 2/6/26.
//

import Foundation

enum AppStrings {

    enum Main {
        static let home = "main.home"
        static let search = "main.search"
        static let favourite = "main.favourite"
        static let profile = "main.profile"
    }

    enum Error {
        static let invalidEmail = "error.invalid_email"
        static let emptyEmail = "error.empty_email"
        static let signInError = "sign_in.error"
        static let wrongOTP = "error.wrong_otp"
        static let insufficientOTP = "error.insufficient_otp"
        static let verifyOTPError = "verify_otp_error"
    }

    enum Common {
        static let ok = "ok"
        static let cancel = "cancel"
        static let product = "product"
        static let coupon = "coupon"
        static let store = "store"
    }

    enum SignIn {
        static let sendCode = "sign_in.send_code"
        static let emailPlaceholder = "sign_in.email"
    }

    enum VerifyOtp {
        static let title = "verify_otp.title"
        static let enterVerificationCode = "verify_otp_enter_verification_code"
        static let verify = "verify"
        static let resendCode = "verify_resend_code"
        static let changeVerificationEmail = "verify_change_verification_email"
    }
    
    enum Home {
        static let welcome = "home.welcome"
        static let closingIn = "closing_in"
        static let category = "category"
        static let flashSale = "flash_sale"
        static let clothes = "clothes"
        static let electronics = "electronics"
        static let watches = "watches"
        static let shoes = "shoes"
        static let bags = "bags"
        static let beauty = "beauty"
        static let sports = "sports"
        static let books = "books"
        static let furniture = "furniture"
        static let toys = "toys"
    }
    
    enum Favourite {
        static let noFavourite = "noFavourite"
    }

    enum Profile {
        static let logout = "profile.logout"
        static let editAccount = "profile.editAccount"
        static let editProfile = "profile.editProfile"
        static let deleteAccount = "profile.deleteAccount"
        static let setting = "profile.setting"
        static let language = "profile.language"
        static let notification = "profile.notification"
        static let other = "profile.other"
        static let contactUs = "profile.contact_us"
        static let privacy = "profile.privacy"
        static let term = "profile.term"
        static let license = "profile.license"
        static let version = "profile.version"
        static let sureLogout = "profile.sureLogout"
        static let chooseLanguage = "profile.chooseLanguage"
    }

    enum LanguageSheet {
        static let english = "languageSheet.english"
        static let japanese = "languageSheet.japanese"
    }
    
    enum ProductDetail {
        static let title = "product_detail"
        static let price = "price"
        static let addToCart = "add_to_cart"
        static let quantity = "quantity"
    }
}
