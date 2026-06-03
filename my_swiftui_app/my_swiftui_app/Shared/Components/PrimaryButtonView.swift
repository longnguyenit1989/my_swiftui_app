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
    let action: () -> Void
    
    init(
        text: String,
        backgroundColor: Color = AppTheme.shared.primary,
        foregroundColor: Color = .white,
        size: CGFloat = 18,
        height: CGFloat = 55,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.size = size
        self.height = height
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: size))
                .foregroundColor(foregroundColor)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(backgroundColor)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    PrimaryButtonView(
        text: "Test",
        backgroundColor: AppTheme.shared.primary,
        foregroundColor: .white,
        size: 18, height: 55, action: {}
    )
    .padding()
}
