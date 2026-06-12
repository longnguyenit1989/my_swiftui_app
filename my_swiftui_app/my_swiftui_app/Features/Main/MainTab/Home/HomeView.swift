//
//  HomeTabView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var session: SessionManager
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: true) {
                VStack(spacing: AppSpacing.paddingItemLarge) {
                    BannerCarouselView(height: AppConstants.bannerHeight)
                        .padding(.bottom, AppSpacing.contentBottom)
                    
                    SectionAndContent(title: AppStrings.Home.category, action: {
                        
                    }) {
                        HorizontalSection(items: viewModel.state.categories, spacing: AppSpacing.lg) {category in
                            CategoryItemView(category: category)
                                .onTapGesture {
                                    viewModel.selectCategory(id: category.id)
                                }
                        }
                    }
                    
                    HStack() {
                        Text(AppStrings.Home.flashSale.l10n).textJp16Bold()
                        Spacer()
                        CountdownView(initialSeconds: 60*2*60)
                    }
                }
            }
            
            .padding()
            .navigationTitle(Text(AppStrings.Main.home.l10n))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
