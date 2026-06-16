//
//  SignInView.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 2/6/26.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                LogoApp().padding(.bottom, AppSpacing.contentBottomLarge)
                
                CustomTextFieldView(
                    title: AppStrings.SignIn.emailPlaceholder,
                    text: $viewModel.state.email
                ).padding(.bottom, AppSpacing.contentBottomLarge)
                
                PrimaryButtonView(
                    text: AppStrings.SignIn.sendCode,
                    isDisabled: viewModel.state.email.isEmpty
                ) {
                    await viewModel.signIn()
                }
            }
            .padding()
            .appContainer($viewModel.viewState)
            
            .navigationDestination(
                isPresented: $viewModel.state.isLoginSuccess
            ) {
                VerifyOtpView(email: viewModel.state.email)
            }
        }
    }
}

#Preview {
    SignInView()
}
