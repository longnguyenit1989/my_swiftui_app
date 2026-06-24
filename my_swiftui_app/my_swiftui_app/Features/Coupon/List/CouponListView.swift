//
//  CouponListView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 23/6/26.
//

import SwiftUI

struct CouponListView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @StateObject private var viewModel = CouponListViewModel()
    
    private let columns = [
        GridItem(.flexible(), spacing: AppSpacing.xs),
        GridItem(.flexible(), spacing: AppSpacing.xs)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: AppSpacing.xs) {
                ForEach(viewModel.pagingState.displayedItems) { coupon in
                    let displayCoupon: Coupon = {
                        var c = coupon
                        c.isFavorite = searchViewModel.state.coupons.first { $0.id == coupon.id }?.isFavorite ?? coupon.isFavorite
                        return c
                    }()
                    
                    CouponItemView(
                        coupon: displayCoupon,
                        onFavoriteTap: {
                            searchViewModel.toggleFavorite(
                                id: coupon.id,
                                type: .coupons,
                            )
                        },
                    )
                    .onAppear { Task { await viewModel.loadMoreIfNeeded(for: coupon) } }
                }
            }
            .padding()
            
            PagingFooter(isLoading: viewModel.pagingState.isLoadingMore)
        }
        .pagingLoading(isLoading: viewModel.pagingState.isInitialLoading)
        .refreshable {
            await viewModel.refresh()
        }
        .task {
            await viewModel.loadInitial()
        }
        .navigationTitle(AppStrings.Coupons.coupons.l10n)
        .navigationBarTitleDisplayMode(.inline)
        .appContainer($viewModel.viewState)
        .hideBottomBar()
    }
}
