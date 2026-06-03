//
//  Text.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

extension Text {
    private func applyTextStyle(
        font: Font,
        fontSize: CGFloat
    ) -> some View {
        self
            .font(font)
            .foregroundColor(AppTheme.shared.textPrimary)
            .kerning(fontSize * 0.05)
            .lineSpacing(fontSize * 0.5)
    }
    
    func textJp14() -> some View {
        applyTextStyle(
            font: AppTextStyle.jp14,
            fontSize: AppTextStyle.jp14Size
        )
    }
    
    func textJp14Bold() -> some View {
        applyTextStyle(
            font: AppTextStyle.jp14Bold,
            fontSize: AppTextStyle.jp14Size
        )
    }
    
    func textJp14Underlined() -> some View {
        self
            .font(AppTextStyle.jp14)
            .underline()
    }
    
    func textJp16() -> some View {
        applyTextStyle(
            font: AppTextStyle.jp14Bold,
            fontSize: AppTextStyle.jp14Size
        )
    }
}
