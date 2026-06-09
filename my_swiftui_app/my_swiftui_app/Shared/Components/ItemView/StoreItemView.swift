//
//  StoreItemView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

import SwiftUI

struct StoreItemView: View {
    let store: Store
    let onFavoriteTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(store.imageName).cardImageStyle()

                FavoriteButton(
                    isFavorite: store.isFavorite,
                    action: onFavoriteTap
                )
                .padding(AppSpacing.xs)
            }
            
            Divider().frame(height: AppConstants.borderWidth)
            
            VStack(alignment: .leading, spacing: AppSpacing.xs) {
                Text(store.title)
                    .textJp14Bold()
                    .singleLine()
                
                Text(store.des)
                    .textJp12(color: AppColor.shared.textTertiary)
                    .doubleLine()
            }
            .padding(AppSpacing.sm)
        }
        .overlay(
            RoundedRectangle(cornerRadius: AppSpacing.xs)
                .stroke(
                    AppColor.shared.border,
                    lineWidth: AppConstants.borderWidth
                )
        )
        .clipShape(RoundedRectangle(cornerRadius: AppSpacing.xs))
        .frame(
            width: AppConstants.cardWidth,
        )
        .shadow(color: .black.opacity(0.08),radius: 6, x: 0, y: 3)
    }
}
