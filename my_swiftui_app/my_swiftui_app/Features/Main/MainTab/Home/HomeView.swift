//
//  HomeTabView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var session: SessionManager

    var body: some View {
        NavigationStack {
            VStack(spacing: AppSpacing.xl) {
                Spacer()
                Text(AppStrings.Home.welcome.l10n)
                    .textJp14Bold()
                    .scaleEffect(1.5)
                Spacer()
            }
            .padding()
            .navigationTitle(Text(AppStrings.Main.home.l10n))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
