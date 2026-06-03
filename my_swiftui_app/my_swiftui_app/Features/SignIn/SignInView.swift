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
                LogoBetterTech()
                    .padding(.bottom, AppSpacing.xl)
                CustomTextFieldView(
                    title: AppStrings.SignIn.emailPlaceholder,
                    text: $viewModel.state.email
                )
                    .padding(.bottom, AppSpacing.xl)
                
                PrimaryButtonView(text: AppStrings.SignIn.sendCode) {
                    Task {
                        await viewModel.signIn()
                    }
                }
            }
            .padding()
            .loadingOverlay(viewModel.state.viewState.isLoading)
            .navigationDestination(
                isPresented: $viewModel.state.isLoginSuccess,
                destination: {
                    VerifyOtpView(email: viewModel.state.email)
                }
            )
            .alert(isPresented: $viewModel.state.viewState.showError) {
                Alert(
                    title: Text(AppStrings.SignIn.signInError),
                    message: Text(viewModel.state.viewState.errorMessage ?? ""),
                    dismissButton: .default(Text(AppStrings.Common.ok))
                )
            }
        }
    }
}

#Preview {
    SignInView()
}
