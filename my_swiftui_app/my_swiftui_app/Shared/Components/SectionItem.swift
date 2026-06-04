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

    init(
        title: String,
        height: CGFloat = 48,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.height = height
        self.action = action
    }

    var body: some View {
        Button {
            action?()
        } label: {
            VStack(spacing: 0) {
                HStack {
                    Text(title).textJp14()

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundColor(AppColor.shared.primary)
                        .font(.system(size: 14, weight: .medium))
                        .padding(.trailing, AppSpacing.xs)
                }
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)

                Rectangle()
                    .fill(AppColor.shared.border)
                    .frame(height: 2)
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
