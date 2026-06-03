//
//  View.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

extension View {
    func loadingOverlay(_ isLoading: Bool) -> some View {
        modifier(
            LoadingOverlayModifier(
                isLoading: isLoading
            )
        )
    }
    
    func toast(_ message: Binding<String?>) -> some View {
        self.modifier(ToastModifier(message: message))
    }
}
