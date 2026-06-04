//
//  SignInViewModel.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 2/6/26.
//

import Foundation
import Combine

@MainActor
final class SignInViewModel: BaseViewModel {
    @Published var state = SignInState()

    func signIn() async {
        guard validate() else { return }

        setLoading(true)
        defer { setLoading(false) }

        try? await Task.sleep(for: .seconds(2))
        state.isLoginSuccess = true
    }

    private func validate() -> Bool {
        if state.email.isEmpty {
            setError(
                title: AppStrings.Error.signInError,
                message: SignInError.emptyEmail.message
            )
            return false
        }
        if !state.email.isValidEmail {
            setError(
                title: AppStrings.Error.signInError,
                message: SignInError.invalidEmail.message
            )
            return false
        }
        return true
    }
}
