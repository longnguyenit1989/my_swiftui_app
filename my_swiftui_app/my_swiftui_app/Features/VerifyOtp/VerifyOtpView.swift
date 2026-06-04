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
            
            Text(AppStrings.VerifyOtp.enterVerificationCode)
                .textJp14()
                .padding(.bottom, AppSpacing.lg)
            
            OTPDigitBox(otp: $otp)
                .padding(.bottom, AppSpacing.lg)
            
            PrimaryButtonView(
                text: AppStrings.VerifyOtp.verify,
                isDisabled: otp.isEmpty
            ) {
                let success = await viewModel.submitOTP(otp: otp)
                if success {
                    session.login(email: email)
                }
            }
            .padding(.bottom, AppSpacing.lg)
            
            Button {
                showToast(AppStrings.VerifyOtp.resendCode)
            } label: {
                Text(AppStrings.VerifyOtp.resendCode).textJp14Underlined()
            }
            .padding(.bottom, AppSpacing.sm)
            
            Button {
                showToast(AppStrings.VerifyOtp.changeVerificationEmail)
            } label: {
                Text(AppStrings.VerifyOtp.changeVerificationEmail).textJp14Underlined()
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(AppStrings.VerifyOtp.title)
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
