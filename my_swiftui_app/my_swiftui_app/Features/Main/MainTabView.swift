//
//  HomeView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var searchViewModel = SearchViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text(AppStrings.Main.home.l10n)
                }
            SearchView(viewModel: searchViewModel)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(AppStrings.Main.search.l10n)
                }
            FavouriteView(viewModel: searchViewModel)
                .tabItem {
                    Image(systemName: "heart")
                    Text(AppStrings.Main.favourite.l10n)
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text(AppStrings.Main.profile.l10n)
                }
        }
        .tint(AppColor.shared.primary)
    }
}
