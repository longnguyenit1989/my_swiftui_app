//
//  VerifyOtpError.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

enum VerifyOtpError: Error {
    case wrongOTP
    case insufficientOTP
    
    var message: String {
        switch self {
        case .wrongOTP:
            return AppStrings.Error.wrongOTP
        case .insufficientOTP:
            return AppStrings.Error.insufficientOTP
        }
    }
}
