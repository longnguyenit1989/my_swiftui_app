//
//  AppContainerModifier.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct AppContainerModifier: ViewModifier {
    @Binding var viewState: ViewState
    
    func body(content: Content) -> some View {
        let isLoading = viewState.isLoading
        
        content
            .modifier(
                LoadingOverlayModifier(
                    isLoading: isLoading
                )
            )
            .navigationBarBackButtonHidden(isLoading)
            .interactiveDismissDisabled(isLoading)
            .alert(item: $viewState.alert) { alert in
                Alert(
                    title: Text(alert.title.l10n),
                    message: Text(alert.message.l10n),
                    dismissButton: .default(Text(AppStrings.Common.ok))
                )
            }
    }
}
