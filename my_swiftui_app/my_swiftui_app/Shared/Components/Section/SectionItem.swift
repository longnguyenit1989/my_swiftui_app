//
//  SectionItem.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct SectionItem<TrailingView: View>: View {
    let title: String
    let height: CGFloat
    let action: (() -> Void)?

    let trailingText: String?
    let hideChevron: Bool

    let trailingView: TrailingView

    init(
        title: String,
        height: CGFloat = 48,
        action: (() -> Void)? = nil,
        trailingText: String? = nil,
        hideChevron: Bool = false,
        @ViewBuilder trailingView: () -> TrailingView = { EmptyView() }
    ) {
        self.title = title
        self.height = height
        self.action = action
        self.trailingText = trailingText
        self.hideChevron = hideChevron
        self.trailingView = trailingView()
    }

    var body: some View {
        Button {
            action?()
        } label: {
            VStack(spacing: 0) {
                HStack {
                    Text(title.l10n)
                        .textJp14()

                    Spacer()

                    if let trailingText, !trailingText.isEmpty {
                        Text(trailingText.l10n)
                            .textJp14Secondary()
                    }

                    trailingView.padding(.horizontal, AppSpacing.xs)

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
                    .frame(height: AppConstants.borderWidth)
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
