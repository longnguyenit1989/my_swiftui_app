//
//  VerifyOtpView.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

struct VerifyOtpView: View {
    @EnvironmentObject private var session: SessionManager
    
    @StateObject private var viewModel = VerifyOtpViewModel()
    @State private var otp = ""
    @State private var toastMessage: String?
    let email: String
    
    var body: some View {
        VStack {
            Text(email).textJp14Bold()
            
            Text(AppStrings.VerifyOtp.enterVerificationCode.l10n)
                .textJp14()
                .padding(.bottom, AppSpacing.contentBottom)
            
            OTPDigitBox(otp: $otp)
                .padding(.bottom, AppSpacing.contentBottom)
            
            PrimaryButtonView(
                text: AppStrings.VerifyOtp.verify,
                isDisabled: otp.isEmpty
            ) {
                let success = await viewModel.submitOTP(otp: otp)
                if success {
                    session.login(email: email)
                }
            }
            .padding(.bottom, AppConstants.radiusButton)
            
            Button {
                showToast(AppStrings.VerifyOtp.resendCode)
            } label: {
                Text(AppStrings.VerifyOtp.resendCode.l10n).textJp14Underlined()
            }
            
            Button {
                showToast(AppStrings.VerifyOtp.changeVerificationEmail)
            } label: {
                Text(AppStrings.VerifyOtp.changeVerificationEmail.l10n).textJp14Underlined()
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(AppStrings.VerifyOtp.title.l10n)
        .appContainer($viewModel.viewState)
        .toast($toastMessage)
    }
    
    private func showToast(_ message: String) {
        toastMessage = message
    }
}

#Preview {
    VerifyOtpView(email: "test@gmail.com")
}
