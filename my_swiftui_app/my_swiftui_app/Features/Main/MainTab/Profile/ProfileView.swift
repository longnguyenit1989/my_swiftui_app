//
//  ProfileView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct ProfileView: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    SectionHeader(title: AppStrings.Profile.editProfile)
                    SectionItem(title: AppStrings.Profile.editAccount)
                    SectionItem(title: AppStrings.Profile.deleteAccount)
                }
            }
            .padding()
            .navigationTitle(AppStrings.Main.profile)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
