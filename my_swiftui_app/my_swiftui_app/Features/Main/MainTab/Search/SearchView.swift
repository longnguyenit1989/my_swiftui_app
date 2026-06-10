//
//  SearchView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: true) {
                VStack(spacing: 16) {
                    SectionAndContent(title: AppStrings.Common.product, action: {
                        
                    }) {
                        HorizontalSection(items: viewModel.state.products) { product in
                            ProductItemView(
                                product: product,
                                onFavoriteTap: {
                                    viewModel.toggleFavorite(id: product.id, type: .products)
                                }
                            )
                        }
                    }
                    
                    SectionAndContent(title: AppStrings.Common.coupon, action: {
                        
                    }) {
                        HorizontalSection(items: viewModel.state.coupons) { coupon in
                            CouponItemView(
                                coupon: coupon,
                                onFavoriteTap: {
                                    viewModel.toggleFavorite(id: coupon.id, type: .coupons)
                                }
                            )
                        }
                    }
                    
                    SectionAndContent(title: AppStrings.Common.store, action: {
                        
                    }) {
                        HorizontalSection(items: viewModel.state.stores) { store in
                            StoreItemView(
                                store: store,
                                onFavoriteTap: {
                                    viewModel.toggleFavorite(id: store.id, type: .stores)
                                }
                            )
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(Text(AppStrings.Main.search.l10n))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
