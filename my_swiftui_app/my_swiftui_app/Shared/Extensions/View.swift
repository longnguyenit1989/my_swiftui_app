//
//  View.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

extension View {
    func appContainer(_ viewState: Binding<ViewState>) -> some View {
        modifier(AppContainerModifier(viewState: viewState))
    }
    
    func toast(_ message: Binding<String?>) -> some View {
        self.modifier(ToastModifier(message: message))
    }
}
