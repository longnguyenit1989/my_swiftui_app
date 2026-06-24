//
//  ProductListView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 15/6/26.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @StateObject private var viewModel = ProductListViewModel()
    
    @State private var selectedProduct: Product?
    
    private let columns = [
        GridItem(.flexible(), spacing: AppSpacing.xs),
        GridItem(.flexible(), spacing: AppSpacing.xs)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: AppSpacing.xs) {
                ForEach(viewModel.pagingState.displayedItems) { product in
                    let displayProduct: Product = {
                        var p = product
                        p.isFavorite = searchViewModel.state.products.first { $0.id == product.id }?.isFavorite ?? product.isFavorite
                        return p
                    }()
                    
                    ProductItemView(
                        product: displayProduct,
                        showFavourite: true,
                        onFavoriteTap: {
                            searchViewModel.toggleFavorite(
                                id: product.id,
                                type: .products,
                                fallbackProduct: product
                            )
                        },
                        onItemTap: { product in
                            selectedProduct = product
                        }
                    )
                    .onAppear { Task { await viewModel.loadMoreIfNeeded(for: product) } }
                }
            }
            .paddingScreen()
            
            PagingFooter(isLoading: viewModel.pagingState.isLoadingMore)
        }
        .pagingLoading(isLoading: viewModel.pagingState.isInitialLoading)
        .refreshable {
            await viewModel.refresh()
        }
        .task {
            await viewModel.loadInitial()
        }
        .navigationTitle(AppStrings.Products.products.l10n)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(item: $selectedProduct) { product in
            ProductDetailView(
                viewModel: searchViewModel,
                productId: product.id,
                fallbackProduct: product
            )
        }
        .appContainer($viewModel.viewState)
        .hideBottomBar()
    }
}
