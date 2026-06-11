//
//  CategoryItemView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 11/6/26.
//

import SwiftUI

import SwiftUI

struct CategoryItemView: View {
    let category: Category

    var body: some View {
        VStack(spacing: AppSpacing.xs) {
            Circle()
                .fill(
                    category.isSelected
                    ? AppColor.shared.primary
                    : Color.gray.opacity(0.15)
                )
                .frame(width: AppConstants.iconCategorySize, height: AppConstants.iconCategorySize)
                .overlay {
                    Image(systemName: category.imageName)
                        .font(.title3)
                        .foregroundStyle(category.isSelected ? .white : AppColor.shared.primary)
                }

            Text(category.title.l10n)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundStyle(category.isSelected ? AppColor.shared.primary : AppColor.shared.textPrimary)
        }
    }
}
