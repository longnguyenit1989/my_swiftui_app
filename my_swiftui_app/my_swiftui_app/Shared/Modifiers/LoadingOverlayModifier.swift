//
//  LoadingOverlayModifier.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

struct LoadingOverlayModifier: ViewModifier {
    let isLoading: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isLoading)

            if isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .contentShape(Rectangle())

                ProgressView()
                    .scaleEffect(1.5)
            }
        }
    }
}
