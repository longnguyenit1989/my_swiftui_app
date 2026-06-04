//
//  HomeView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text(AppStrings.Main.home)
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(AppStrings.Main.search)
                }
            FavouriteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text(AppStrings.Main.favourite)
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text(AppStrings.Main.profile)
                }
        }
        .tint(AppColor.shared.primary)
    }
}
