//
//  SectionItem.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct SectionItem: View {
    let title: String
    let height: CGFloat
    let action: (() -> Void)?
    
    let trailingText: String?
    let hideChevron: Bool
    
    init(
        title: String,
        height: CGFloat = 48,
        action: (() -> Void)? = nil,
        trailingText: String? = nil,
        hideChevron: Bool = false,
    ) {
        self.title = title
        self.height = height
        self.action = action
        self.trailingText = trailingText
        self.hideChevron = hideChevron
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            VStack(spacing: 0) {
                HStack {
                    Text(title.l10n).textJp14()
                    
                    Spacer()
                    
                    if let trailingText, !trailingText.isEmpty {
                        Text(trailingText.l10n).textJp14Secondary()
                    }
                    
                    if !hideChevron {
                        Image(systemName: "chevron.right")
                            .foregroundColor(AppColor.shared.primary)
                            .font(.system(size: 14, weight: .medium))
                            .padding(.horizontal, AppSpacing.xs)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                
                Rectangle()
                    .fill(AppColor.shared.border)
                    .frame(height: 1)
            }
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .contentShape(Rectangle())
        }
        .buttonStyle(PressHighlightStyle())
    }
    
}

#Preview {
    SectionItem(title: "test", action: {})
}
