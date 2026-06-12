//
//  QuantitySelector.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 12/6/26.
//

import SwiftUI

struct QuantitySelector: View {
    let selectedQuantity: Int
    let quantities: [Int]
    let onSelected: (Int) -> Void
    
    var body: some View {
        Menu {
            ForEach(quantities, id: \.self) { quantity in
                Button {
                    onSelected(quantity)
                } label: {
                    Button {
                        onSelected(quantity)
                    } label: {
                        Text(AppStrings.ProductDetail.quantity.l10n)
                            + Text(" \(quantity)")
                    }
                }}
        } label: {
            HStack(spacing: AppSpacing.xs) {
                Text(AppStrings.ProductDetail.quantity.l10n).textJp16()
                Text("\(selectedQuantity)").textJp16()
                Spacer()
                
                Image(systemName: "chevron.down").foregroundStyle(AppColor.shared.textPrimary)
            }
            .padding(14)
            .background(
                RoundedRectangle(
                    cornerRadius: AppConstants.radiusButton
                )
                .stroke(
                    AppColor.shared.border,
                    lineWidth: AppConstants.borderWidth
                )
            )
        }
        
        .onAppear {
            print(Locale.current.language.languageCode?.identifier ?? "")
            print(AppStrings.ProductDetail.quantity.localized)
        }
    }
}
