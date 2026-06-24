//
//  ProductDetail.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 12/6/26.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State private var quantity = 1
    
    let productId: String
    let fallbackProduct: Product?
    
    init(viewModel: SearchViewModel, productId: String, fallbackProduct: Product? = nil) {
        self.viewModel = viewModel
        self.productId = productId
        self.fallbackProduct = fallbackProduct
    }
    
    private var product: Product? {
        viewModel.state.products.first {
            $0.id == productId
        } ?? fallbackProduct
    }
    
    var body: some View {
        if let product {
            ScrollView {
                VStack(alignment: .leading,
                       spacing: AppSpacing.contentBottom) {
                    Image(product.imageName)
                        .cardImageStyle(
                            height: AppConstants.imageDetailHeight
                        )
                    Text(product.title)
                        .textJp16Bold()
                    HStack {
                        Text(AppStrings.ProductDetail.price.l10n)
                        Text("\(product.price)$")
                            .textJp16(
                                color: AppColor.shared.primary
                            )
                        Spacer()
                        FavoriteButton(
                            isFavorite: product.isFavorite,
                            action: {
                                viewModel.toggleFavorite(
                                    id: product.id,
                                    type: .products,
                                    fallbackProduct: product
                                )
                            }
                        )
                    }
                    Text(product.des)
                        .padding(.bottom, AppSpacing.contentBottomLarge)
                    
                    HStack() {
                        QuantitySelector(
                            selectedQuantity: quantity,
                            quantities: Array(1...10)
                        ) { value in
                            quantity = value
                        }
                        .frame(maxWidth: .infinity)
                        PrimaryButtonView(text: AppStrings.ProductDetail.addToCart, action: {
                            
                        })
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .paddingScreen()
            .navigationTitle(AppStrings.ProductDetail.title.l10n)
            .hideBottomBar()
        }
    }
}
