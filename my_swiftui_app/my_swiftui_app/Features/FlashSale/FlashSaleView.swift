//
//  Untitled.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 29/6/26.
//

import SwiftUI

struct FlashSaleView: View {
    @StateObject private var viewModel = FlashSaleViewModel()
    
    private let columns = [
        GridItem(.flexible(), spacing: AppSpacing.xs),
        GridItem(.flexible(), spacing: AppSpacing.xs)
    ]
    
    @State private var selectedDiscount = 0
    
    let discounts = [10, 20, 30, 40]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(spacing: 24) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(AppStrings.Home.flashSale.l10n)
                                .textJp20Bold(color: .white)
                            Text(AppStrings.FlashSale.chooseYourDiscount.l10n)
                                .textJp14(color: .white.opacity(0.9))
                        }
                        
                        Spacer()
                        
                        CountdownView(initialSeconds: 2 * 60 * 60)
                    }
                    
                    DiscountSelector(
                        values: discounts,
                        selected: Binding(
                            get: { viewModel.selectedDiscount },
                            set: { viewModel.selectedDiscount = $0 }
                        )
                    )
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(AppColor.shared.primary)
                )
                
                Text(AppStrings.FlashSale.bestSellingItem.l10n).textJp16Bold()
                
                LazyVGrid(columns: columns, spacing: AppSpacing.xs) {
                    ForEach(viewModel.filteredProducts) { product in
                        let displayProduct: Product = {
                            let p = product
                            return p
                        }()
                        
                        ProductItemView(
                            product: displayProduct,
                            width: nil,
                            showFavourite: false,
                            onFavoriteTap: {}
                        )
                        .onAppear { Task { await viewModel.loadMoreIfNeeded(for: product) } }
                    }
                }
                PagingFooter(isLoading: viewModel.pagingState.isLoadingMore)
            }
        }
        .paddingScreen()
        .navigationTitle(AppStrings.Home.flashSale.l10n)
        .pagingLoading(isLoading: viewModel.pagingState.isInitialLoading)
        .refreshable {
            await viewModel.refresh()
        }
        .task {
            await viewModel.loadInitial()
        }
    }
}
