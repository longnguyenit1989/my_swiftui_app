//
//  CouponItemView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 8/6/26.
//

import SwiftUI

struct CouponItemView: View {
    let coupon: Coupon
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(coupon.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: AppConstants.imageHeight, alignment: .center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 40)
                .padding(.vertical, 12)
            
            Divider().frame(height: AppConstants.borderWidth)
            
            VStack(alignment: .center, spacing: AppSpacing.xs) {
                Text(coupon.title.l10n)
                    .textJp14Bold()
                    .singleLine()
                
                Text(coupon.storeName.l10n)
                    .textJp10(color: AppColor.shared.textTertiary)
                    .singleLine()
                
                VStack(alignment: .center, spacing: AppSpacing.xxs) {
                    Text(coupon.discountText.l10n)
                        .textJp14Bold(
                            color: AppColor.shared.primary
                        )
                        .singleLine()
                    
                    Text(coupon.expirationDate.l10n).textJp10(color: AppColor.shared.primaryMuted)
                        .singleLine()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: AppSpacing.xs).fill(AppColor.shared.primaryLight)
                )
            }
            .padding(AppSpacing.sm)
        }
        .overlay(
            RoundedRectangle(cornerRadius: AppSpacing.xs)
                .stroke(AppColor.shared.border, lineWidth: AppConstants.borderWidth)
        )
        .clipShape(RoundedRectangle(cornerRadius: AppSpacing.xs))
        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 0, y: 4)
        .frame(
            width: AppConstants.cardWidth,
        )
    }
}
