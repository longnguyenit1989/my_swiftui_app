//
//  ProductItemView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    let width: CGFloat
    let onFavoriteTap: () -> Void
    
    init(product: Product, width: CGFloat = AppConstants.cardWidth, onFavoriteTap: @escaping () -> Void) {
        self.product = product
        self.width = width
        self.onFavoriteTap = onFavoriteTap
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(product.imageName)
                    .cardImageStyle()
                
                FavoriteButton(
                    isFavorite: product.isFavorite,
                    action: onFavoriteTap
                )
                .padding(AppSpacing.xs)
            }
            
            Divider().frame(height: AppConstants.borderWidth)
            
            VStack(alignment: .leading, spacing: AppSpacing.xs) {
                Text(product.title)
                    .textJp14Bold()
                    .singleLine()
                
                Text(product.storeName)
                    .textJp12(color: AppColor.shared.textTertiary)
                    .singleLine()
                
                HStack {
                    RatingBar(rating: product.starCount)
                    Text(String(format: "%.1f", product.starCount))
                }
            }
            .padding(AppSpacing.sm)
        }
        .frame(width: width)
        .overlay(
            RoundedRectangle(cornerRadius: AppSpacing.xs)
                .stroke(
                    AppColor.shared.border,
                    lineWidth: AppConstants.borderWidth
                )
        )
        .clipShape(
            RoundedRectangle(cornerRadius: AppSpacing.xs)
        )
        .shadow(color: .black.opacity(0.08),radius: 6, x: 0, y: 3)
    }
}
