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
        fontSize: CGFloat,
        textColor: Color? = nil
    ) -> some View {
        self
            .font(font)
            .foregroundColor(textColor ?? AppColor.shared.textPrimary)
            .kerning(fontSize * 0.05)
            .lineSpacing(fontSize * 0.5)
    }
    
    func textJp10(
        color: Color = AppColor.shared.textPrimary
    ) -> some View {
        applyTextStyle(
            font: AppTextStyle.jp10,
            fontSize: AppTextStyle.jp10Size,
            textColor: color
        )
    }
    
    func textJp12(
        color: Color = AppColor.shared.textPrimary
    ) -> some View {
        applyTextStyle(
            font: AppTextStyle.jp12,
            fontSize: AppTextStyle.jp12Size,
            textColor: color
        )
    }
    
    func textJp12Secondary(
        color: Color = AppColor.shared.textSecondary
    ) -> some View {
        applyTextStyle(
            font: AppTextStyle.jp12,
            fontSize: AppTextStyle.jp12Size,
            textColor: color
        )
    }
    
    func textJp14(
        color: Color = AppColor.shared.textPrimary
    ) -> some View {
        applyTextStyle(
            font: AppTextStyle.jp14,
            fontSize: AppTextStyle.jp14Size,
            textColor: color
        )
    }
    
    func textJp14Bold(
        color: Color = AppColor.shared.textPrimary
    ) -> some View {
        applyTextStyle(
            font: AppTextStyle.jp14Bold,
            fontSize: AppTextStyle.jp14Size,
            textColor: color
        )
    }
    
    func textJp14Underlined() -> some View {
        self
            .font(AppTextStyle.jp14)
            .underline()
    }
    
    func textJp14Secondary(
        color: Color = AppColor.shared.textSecondary
    ) -> some View {
        applyTextStyle(
            font: AppTextStyle.jp14,
            fontSize: AppTextStyle.jp14Size,
            textColor: color
        )
    }
    
    func textJp16(
        color: Color = AppColor.shared.textPrimary
    ) -> some View {
        applyTextStyle(
            font: AppTextStyle.jp16,
            fontSize: AppTextStyle.jp16Size,
            textColor: color
        )
    }
    
    func textJp16Bold(
        color: Color = AppColor.shared.textPrimary
    ) -> some View {
        applyTextStyle(
            font: AppTextStyle.jp16Bold,
            fontSize: AppTextStyle.jp16Size,
            textColor: color
        )
    }
}
