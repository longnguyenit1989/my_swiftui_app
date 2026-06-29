//
//  View.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

struct TextCapsuleModifier: ViewModifier {
    
    let font: Font
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let backgroundColor: Color
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(backgroundColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

extension View {
    func appContainer(_ viewState: Binding<ViewState>) -> some View {
        modifier(AppContainerModifier(viewState: viewState))
    }
    
    func pagingLoading(isLoading: Bool) -> some View {
        overlay {
            if isLoading {
                ProgressView().tint(AppColor.shared.gray)
            }
        }
    }
    
    func toast(_ message: Binding<String?>) -> some View {
        self.modifier(ToastModifier(message: message))
    }
    
    func singleLine() -> some View {
        self
            .lineLimit(1)
            .truncationMode(.tail)
    }
    
    func doubleLine() -> some View {
        self
            .lineLimit(2)
            .truncationMode(.tail)
    }
    
    func hideBottomBar() -> some View {
        toolbar(.hidden, for: .tabBar)
    }
    
    func paddingScreen() -> some View {
        padding(AppSpacing.screenHorizontal)
    }
    
    func textCapsule(
        font: Font = .subheadline,
        horizontalPadding: CGFloat = 12,
        verticalPadding: CGFloat = 6,
        backgroundColor: Color = AppColor.shared.primary,
        cornerRadius: CGFloat = 12
    ) -> some View {
        modifier(
            TextCapsuleModifier(
                font: font,
                horizontalPadding: horizontalPadding,
                verticalPadding: verticalPadding,
                backgroundColor: backgroundColor,
                cornerRadius: cornerRadius
            )
        )
    }
}
