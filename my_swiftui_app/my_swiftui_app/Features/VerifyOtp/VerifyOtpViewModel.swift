//
//  VerifyOtpViewModel.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import Foundation
import Combine

@MainActor
final class VerifyOtpViewModel: ObservableObject {
    @Published var state: VerifyOtpState
    
    init(email: String) {
        self.state = VerifyOtpState(
            email: email
        )
    }
}
