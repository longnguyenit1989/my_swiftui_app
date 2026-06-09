//
//  SearchView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct SearchView: View {
    @StateObject
    private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: true) {
                VStack(spacing: 16) {
                    section(title: AppStrings.Common.product, action: {
                        
                    }) {
                        horizontalSection(items: viewModel.state.products) { product in
                            ProductItemView(
                                product: product,
                                onFavoriteTap: {
                                    viewModel.toggleFavorite(id: product.id, type: .products)
                                }
                            )
                        }
                    }
                    
                    section(title: AppStrings.Common.coupon, action: {
                        
                    }) {
                        horizontalSection(items: viewModel.state.coupons) { coupon in
                            CouponItemView(
                                coupon: coupon,
                                onFavoriteTap: {
                                    viewModel.toggleFavorite(id: coupon.id, type: .coupons)
                                }
                            )
                        }
                    }
                    
                    section(title: AppStrings.Common.store, action: {
                        
                    }) {
                        horizontalSection(items: viewModel.state.stores) { store in
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
    
    @ViewBuilder
    private func section<Content: View>(
        title: String,
        action: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading) {
            SectionTitleView(
                title: title,
                action: action
            )
            content()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
    
    @ViewBuilder
    private func horizontalSection<Item: Identifiable, Content: View>(
        items: [Item],
        spacing: CGFloat = AppSpacing.sm,
        content: @escaping (Item) -> Content
    ) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: spacing) {
                ForEach(items) { item in
                    content(item)
                }
            }
        }
    }
}
