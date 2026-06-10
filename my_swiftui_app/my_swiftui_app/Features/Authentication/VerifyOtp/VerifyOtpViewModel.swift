//
//  VerifyOtpViewModel.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import Foundation
import Combine

@MainActor
final class VerifyOtpViewModel: BaseViewModel {
    @Published var state = VerifyOtpState()

    func submitOTP(otp: String) async -> Bool {
        guard otp.count > 5 else {
            setError(
                title: AppStrings.Error.verifyOTPError,
                message: VerifyOtpError.insufficientOTP.message
            )
            return false
        }
        
        setLoading(true)
        defer { setLoading(false) }
        try? await Task.sleep(for: .seconds(2))
        
        return true
    }
}
