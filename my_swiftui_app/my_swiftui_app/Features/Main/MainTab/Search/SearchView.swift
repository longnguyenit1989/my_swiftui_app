//
//  SearchView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    @State private var searchText = ""
    @State private var searchTask: Task<Void, Never>?
    
    @State private var selectedProduct: Product?
    @State private var showProducts: Bool = false
    @State private var showCoupons: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: true) {
                VStack(spacing: AppSpacing.md) {
                    SearchBar(
                        text: $searchText,
                        placeholder: AppStrings.Search.searchAnything
                    ).onChange(of: searchText) { _, newValue in
                        searchTask?.cancel()
                        
                        searchTask = Task {
                            try? await Task.sleep(for: .seconds(1))
                            guard !Task.isCancelled else {
                                return
                            }
                            
                            await MainActor.run {
                                viewModel.search(keyword: newValue)
                            }
                        }
                    }
                    
                    SectionAndContent(title: AppStrings.Common.product, action: {
                        showProducts = true
                    }) {
                        HorizontalSection(items: viewModel.state.products) { product in
                            ProductItemView(
                                product: product,
                                onFavoriteTap: {
                                    viewModel.toggleFavorite(id: product.id, type: .products)
                                },
                                onItemTap: { product in
                                    selectedProduct = product
                                }
                            )
                        }
                    }
                    
                    SectionAndContent(title: AppStrings.Common.coupon, action: {
                        showCoupons = true
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
            .paddingScreen()
            .navigationTitle(Text(AppStrings.Main.search.l10n))
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(item: $selectedProduct) { product in
                ProductDetailView(viewModel: self.viewModel, productId: product.id, fallbackProduct: product)
            }
            .navigationDestination(isPresented: $showProducts) {
                ProductListView(searchViewModel: viewModel)
            }
            .navigationDestination(isPresented: $showCoupons) {
                CouponListView(searchViewModel: viewModel)
            }
        }
    }
}
