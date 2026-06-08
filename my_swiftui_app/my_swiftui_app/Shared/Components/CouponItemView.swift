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
        VStack(alignment: .leading, spacing: AppSpacing.xs) {
            Image(coupon.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 67)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 40)
                .padding(.vertical, 12)
                .frame(maxHeight: .infinity, alignment: .center)
            
            Divider()
            
            VStack(alignment: .center, spacing: AppSpacing.xs) {
                Text(coupon.title.l10n)
                    .textJp14Bold()
                    .lineLimit(2)
                
                Text(coupon.storeName.l10n)
                    .textJp11(color: AppColor.shared.textTertiary)
                    .lineLimit(1)
                
                VStack(alignment: .center, spacing: AppSpacing.xxs) {
                    Text(coupon.discountText.l10n)
                        .textJp14Bold(
                            color: AppColor.shared.primary
                        )
                    
                    Text(coupon.expirationDate.l10n).textJp12Secondary(color: AppColor.shared.primaryMuted)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: AppSpacing.xs).fill(AppColor.shared.primaryLight)
                )
            }
            .padding(.horizontal, AppSpacing.sm)
            .padding(.vertical, AppSpacing.lg)
        }
        .overlay(
            RoundedRectangle(cornerRadius: AppSpacing.xs)
                .stroke(AppColor.shared.border, lineWidth: 2)
        )
        .clipShape(RoundedRectangle(cornerRadius: AppSpacing.xs))
        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 0, y: 4)
    }
}
