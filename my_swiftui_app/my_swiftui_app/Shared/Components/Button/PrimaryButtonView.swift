//
//  Untitled.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 2/6/26.
//

import SwiftUI

struct PrimaryButtonView: View {
    
    let text: String
    let backgroundColor: Color
    let foregroundColor: Color
    let size: CGFloat
    let height: CGFloat
    let isDisabled: Bool
    let action: () async -> Void
    
    init(
        text: String,
        backgroundColor: Color = AppColor.shared.primary,
        foregroundColor: Color = .white,
        size: CGFloat = AppSpacing.md,
        height: CGFloat = AppConstants.buttonHeight,
        isDisabled: Bool = false,
        action: @escaping () async -> Void
    ) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.size = size
        self.height = height
        self.isDisabled = isDisabled
        self.action = action
    }
    
    var body: some View {
            Button {
                Task {
                    await action()
                }
            } label: {
                Text(text.l10n)
                    .font(.system(size: size))
                    .foregroundColor(foregroundColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: height)
                    .background(isDisabled ? Color.gray.opacity(0.4) : backgroundColor)
                    .cornerRadius(AppConstants.radiusButton)
            }
            .disabled(isDisabled)
        }
}

#Preview {
    PrimaryButtonView(
        text: "Test",
        backgroundColor: AppColor.shared.primary,
        foregroundColor: .white,
        size: 18, height: 55, action: {}
    )
    .padding()
}
