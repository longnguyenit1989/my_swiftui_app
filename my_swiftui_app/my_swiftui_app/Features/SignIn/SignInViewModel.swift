//
//  SignInViewModel.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 2/6/26.
//

import Foundation
import Combine

@MainActor
final class SignInViewModel: ObservableObject {
    @Published var state = SignInState()

    func signIn() async {
        guard validate() else {
            return
        }

        state.viewState.isLoading = true
        defer {
            state.viewState.isLoading = false
        }
        do {
            try await Task.sleep(for: .seconds(2))
            state.isLoginSuccess = true
            // call api
        } catch {
            setError(error.localizedDescription)
        }
    }

    private func validate() -> Bool {
        if state.email.isEmpty {
            setError(AppStrings.Error.emptyEmail)
            return false
        }
        if !state.email.isValidEmail {
            setError(AppStrings.Error.invalidEmail)
            return false
        }
        return true
    }
    
    private func setError(_ messageError: String) {
        state.viewState.errorMessage = messageError
        state.viewState.showError = true
    }
}
