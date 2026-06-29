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
    @State private var productColor: ProductColor = .red
    
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
    
    private var totalPrice: Int {
        guard let product else { return 0 }
        return quantity * product.price
    }
    
    var body: some View {
        if let product {
            ScrollView {
                VStack(alignment: .leading,
                       spacing: AppSpacing.contentBottom) {
                    
                    ZStack() {
                        Image(product.imageName)
                            .cardImageStyle(
                                height: AppConstants.imageDetailHeight
                            )
                        
                    }
                    .overlay(alignment: .topLeading) {
                        Text("-12%").textCapsule()
                    }
                    .overlay(alignment: .topTrailing) {
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
                    
                    Text(product.title).textJp16Bold()
                    
                    Text(product.des).padding(.bottom, AppSpacing.contentBottom)
                    
                    HStack {
                        Image(systemName:"star.fill").foregroundStyle(AppColor.shared.primary)
                        Text(String(format: "%.1f", product.starCount))
                        Text("(42 reviews)").foregroundStyle(AppColor.shared.textTertiary)
                        Text("269 sold").foregroundStyle(AppColor.shared.textPrimary)
                    }
                    HStack {
                        Text(AppStrings.ProductDetail.price.l10n).foregroundStyle(AppColor.shared.textTertiary)
                        Text("\(product.price)$")
                            .textJp16(
                                color: AppColor.shared.primary
                            )
                    }
                    
                    HStack {
                        Text(AppStrings.ProductDetail.totalPrice.l10n).foregroundStyle(AppColor.shared.textTertiary)
                        Text("\(totalPrice)$")
                            .textJp16(color: AppColor.shared.primary)
                    }
                    
                    HStack {
                        Text(AppStrings.ProductDetail.color.l10n)
                            .foregroundStyle(AppColor.shared.textTertiary)
                        Text(productColor.rawValue).textJp16(color: productColor.color)
                        
                        Spacer()
                        
                        ColorPickerView(selectedColor: $productColor).padding(.trailing, AppSpacing.xs)
                        
                    }.padding(.bottom, AppSpacing.contentBottomLarge)
                    
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

enum ProductColor: String, CaseIterable {
    case red = "Red"
    case blue = "Blue"
    case black = "Black"
    
    var color: Color {
        switch self {
        case .red: return .red
        case .blue: return .blue
        case .black: return .black
        }
    }
}
