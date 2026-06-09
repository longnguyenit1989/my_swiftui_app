//
//  ProductItemView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: AppConstants.imageHeight, alignment: .center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 40)
                .padding(.vertical, 12)
            
            Divider().frame(height: AppConstants.borderWidth)

            VStack(alignment: .leading, spacing: AppSpacing.sm) {
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
                
                Spacer()
            }
            .padding(AppSpacing.sm)
        }
        .frame(
            width: AppConstants.cardWidth,
        )
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
        .shadow(
            color: Color.black.opacity(0.10),
            radius: 8,
            x: 0,
            y: 4
        )
    }
}
