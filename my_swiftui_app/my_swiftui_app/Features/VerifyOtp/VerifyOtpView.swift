//
//  VerifyOtpView.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

struct VerifyOtpView: View {
    @State private var otp = ""
    @StateObject private var viewModel: VerifyOtpViewModel
    @State private var toastMessage: String?
    
    init(email: String) {
        _viewModel = StateObject(wrappedValue: VerifyOtpViewModel(email: email))
    }
    
    var body: some View {
        VStack {
            Text(viewModel.state.email).textJp14Bold()
            Text(AppStrings.VerifyOtp.enterVerificationCode).textJp14()
                .padding(.bottom, 24)
            OTPDigitBox(otp: $otp)
                .padding(.bottom, 24)
            PrimaryButtonView(text: AppStrings.VerifyOtp.verify) {
                
            }
            .padding(.bottom, 24)
            
            Button {
                showToast(AppStrings.VerifyOtp.resendCode)
            } label: {
                Text(AppStrings.VerifyOtp.resendCode).textJp14Underlined()
            }
            .padding(.bottom, 12)
            
            Button {
                showToast(AppStrings.VerifyOtp.changeVerificationEmail)
            } label: {
                Text(AppStrings.VerifyOtp.changeVerificationEmail).textJp14Underlined()
            }
            
            Spacer()
        }
        .navigationTitle(AppStrings.VerifyOtp.title)
        .padding()
        .toast($toastMessage)
    }
    
    private func showToast(_ message: String) {
        toastMessage = message
    }
}


#Preview {
    VerifyOtpView(email: "test@gmail.com")
}
