//
//  FavouriteView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct FavouriteView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State private var selectedTab = 0
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    tabButton(
                        title: AppStrings.Common.product.l10n,
                        index: 0
                    )
                    
                    tabButton(
                        title: AppStrings.Common.coupon.l10n,
                        index: 1
                    )
                    
                    tabButton(
                        title: AppStrings.Common.store.l10n,
                        index: 2
                    )
                }
                .paddingScreen()
                
                TabView(selection: $selectedTab) {
                    productTab.tag(0)
                    couponTab.tag(1)
                    storeTab.tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .navigationTitle(Text(AppStrings.Main.favourite.l10n))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private func tabButton(
        title: LocalizedStringKey,
        index: Int
    ) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedTab = index
            }
        } label: {
            VStack(spacing: AppSpacing.xs) {
                Text(title)
                    .textJp14(
                        color: selectedTab == index
                        ? AppColor.shared.primary
                        : AppColor.shared.textPrimary
                    )
                
                Rectangle()
                    .fill(
                        selectedTab == index
                        ? AppColor.shared.primary
                        : .clear
                    )
                    .frame(height: 2)
            }
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
    }
    
    private var productTab: some View {
        favoriteGrid(items: viewModel.favoriteProducts) { product in
            ProductItemView(
                product: product,
                width: .infinity,
                onFavoriteTap: {
                    viewModel.toggleFavorite(
                        id: product.id,
                        type: .products
                    )
                }
            )
        }
    }
    
    private var couponTab: some View {
        favoriteGrid(items: viewModel.favoriteCoupons) { coupon in
            CouponItemView(
                coupon: coupon,
                onFavoriteTap: {
                    viewModel.toggleFavorite(
                        id: coupon.id,
                        type: .coupons
                    )
                }
            )
        }
    }
    
    private var storeTab: some View {
        favoriteGrid(items: viewModel.favoriteStores) { store in
            StoreItemView(
                store: store,
                onFavoriteTap: {
                    viewModel.toggleFavorite(
                        id: store.id,
                        type: .stores
                    )
                }
            )
        }
    }
    
    @ViewBuilder
    private func favoriteGrid<Item: Identifiable, Content: View>(
        items: [Item],
        @ViewBuilder content: @escaping (Item) -> Content
    ) -> some View {
        
        if items.isEmpty {
            ContentUnavailableView(
                AppStrings.Favourite.noFavourite.l10n,
                systemImage: "heart"
            )
        } else {
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    spacing: AppSpacing.paddingItem
                ) {
                    ForEach(items) { item in
                        content(item)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    FavouriteView(
        viewModel: SearchViewModel()
    )
}
