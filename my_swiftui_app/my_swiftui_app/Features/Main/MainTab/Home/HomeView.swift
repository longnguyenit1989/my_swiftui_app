//
//  HomeTabView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    @State private var avatar: UIImage?
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: true) {
                VStack(spacing: AppSpacing.paddingItem) {
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: AppSpacing.xxs) {
                            Text(Date(), format: .fullDate).textJp14(color: AppColor.shared.gray)
                            Text(AppStrings.Home.welcome.localizedFormat(KeychainStorage.shared.email ?? "")).textJp16Bold()
                        }
                        Spacer()
                        AvatarPickerView(image: $avatar)
                    }
                    
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
                    }.padding(.bottom, AppSpacing.contentBottom)
                    
                    WeeklySalesChartView()
                }
            }
            
            .paddingScreen()
            .navigationTitle(Text(AppStrings.Main.home.l10n))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        NotificationListView()
                    } label: {
                        NotificationButton(
                            unreadCount: 15
                        )
                    }
                }
            }
        }
    }
}
