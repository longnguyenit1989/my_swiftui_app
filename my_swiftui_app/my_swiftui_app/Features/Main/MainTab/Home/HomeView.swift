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

                Text("Welcome Home!")
                    .textJp14Bold()
                    .scaleEffect(1.5)

                PrimaryButtonView(text: AppStrings.Profile.logout) {
                    session.logout()
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}
