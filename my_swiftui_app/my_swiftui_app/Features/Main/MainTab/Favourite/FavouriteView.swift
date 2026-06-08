//
//  FavouriteView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

import SwiftUI

struct FavouriteView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: - Tab Bar
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
                .padding(.horizontal)
                
                // MARK: - Content
                TabView(selection: $selectedTab) {
                    
                    Text("Product").textJp14()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(0)
                    
                    Text("Coupon").textJp14()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(1)
                    
                    Text("Store").textJp14()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(2)
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
}

#Preview {
    FavouriteView()
}
