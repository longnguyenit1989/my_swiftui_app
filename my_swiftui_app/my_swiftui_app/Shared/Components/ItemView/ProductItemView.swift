//
//  ProductItemView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

import SwiftUI

struct ProductItemView: View {

    let product: Product
    let width: CGFloat?
    let onFavoriteTap: () -> Void
    let onItemTap: ((Product) -> Void)?
    var showFavourite: Bool

    init(
        product: Product,
        width: CGFloat? = AppConstants.cardWidth,
        showFavourite: Bool = true,
        onFavoriteTap: @escaping () -> Void,
        onItemTap: ((Product) -> Void)? = nil
    ) {
        self.product = product
        self.width = width
        self.showFavourite = showFavourite
        self.onFavoriteTap = onFavoriteTap
        self.onItemTap = onItemTap
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            ZStack {
                Image(product.imageName)
                    .cardImageStyle()
            }
            .overlay(alignment: .topLeading) {
                Text("-\(product.discount ?? 8)%")
                    .textCapsule(
                        font: .footnote,
                        horizontalPadding: 4,
                        verticalPadding: 2
                    )
                    .padding(AppSpacing.xs)
            }
            .overlay(alignment: .topTrailing) {
                if showFavourite {
                    FavoriteButton(
                        isFavorite: product.isFavorite,
                        action: onFavoriteTap
                    )
                    .padding(AppSpacing.xs)
                }
            }

            Divider().frame(height: AppConstants.borderWidth)

            VStack(alignment: .leading, spacing: AppSpacing.xs) {

                Text(product.title)
                    .textJp14Bold()
                    .singleLine()

                HStack(spacing: 0) {

                    Text(product.storeName)
                        .textJp12(color: AppColor.shared.textTertiary)
                        .singleLine()

                    Spacer()

                    Text("\(product.price)$")
                        .textJp14(color: AppColor.shared.primary)
                        .singleLine()
                }

                HStack {
                    RatingBar(rating: product.starCount)

                    Text(String(format: "%.1f", product.starCount))
                }
            }
            .padding(AppSpacing.sm)
        }
        .modifier(CardWidthModifier(width: width))
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
            color: .black.opacity(0.08),
            radius: 6,
            x: 0,
            y: 3
        )
        .contentShape(Rectangle())
        .onTapGesture {
            onItemTap?(product)
        }
    }
}

private struct CardWidthModifier: ViewModifier {

    let width: CGFloat?

    @ViewBuilder
    func body(content: Content) -> some View {

        if let width {
            content.frame(width: width)
        } else {
            content.frame(maxWidth: .infinity)
        }
    }
}
