//
//  BaseViewModel.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import Foundation
import Combine

@MainActor
class BaseViewModel: ObservableObject {
    @Published var viewState = ViewState()

    func setLoading(_ value: Bool) {
        viewState.isLoading = value
    }

    func setError(title: String, message: String) {
        viewState.alert = AlertState(title: title, message: message)
    }
}
