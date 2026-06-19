//
//  ProfileView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var session: SessionManager
    @EnvironmentObject private var languageManager: LanguageManager
    
    @State private var showLogoutAlert = false
    @State private var showLanguageSheet = false
    
    @State private var showContactUs = false
    @State private var showTerm = false
    @State private var showPrivacy = false
    @State private var showLicense = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    SectionHeader(title: AppStrings.Profile.editProfile)
                    SectionItem(title: AppStrings.Profile.editAccount)
                    SectionItem(title: AppStrings.Profile.deleteAccount)
                        .padding(.bottom,AppSpacing.contentBottom)
                    SectionHeader(title: AppStrings.Profile.setting)
                    SectionItem(
                        title: AppStrings.Profile.language,
                        action: {
                            showLanguageSheet = true
                        },
                        trailingText: languageManager.currentLanguage.displayName)
                    SectionItem(title: AppStrings.Profile.notification)
                        .padding(.bottom,AppSpacing.contentBottom)
                    SectionHeader(title: AppStrings.Profile.other)
                    SectionItem(title: AppStrings.Profile.contactUs, action: {
                        showContactUs = true
                    })
                    SectionItem(title: AppStrings.Profile.privacy, action: {
                        showPrivacy = true
                    })
                    SectionItem(title: AppStrings.Profile.term, action: {
                        showTerm = true
                    })
                    SectionItem(title: AppStrings.Profile.license, action: {
                        showLicense = true
                    })
                    SectionItem(title: AppStrings.Profile.version,
                                trailingText: Bundle.main.versionWithBuild,
                                hideChevron: true)
                    .padding(.bottom,AppSpacing.xl)
                    
                    PrimaryButtonView(text: AppStrings.Profile.logout) {
                        showLogoutAlert = true
                    }
                }
            }
            .padding()
            .navigationTitle(Text(AppStrings.Main.profile.l10n))
            .navigationBarTitleDisplayMode(.inline)
            .alert(AppStrings.Profile.logout.l10n, isPresented: $showLogoutAlert) {
                Button(AppStrings.Common.cancel.l10n, role: .cancel) {}
                Button(AppStrings.Profile.logout.l10n, role: .destructive) {
                    session.logout()
                }
            } message: {
                Text(AppStrings.Profile.sureLogout.l10n)
            }
            .sheet(isPresented: $showLanguageSheet) {
                LanguageSheetView()
                    .presentationDetents([.height(200)])
                    .presentationDragIndicator(.visible)
            }
            .navigationDestination(isPresented: $showContactUs) {
                CommonWebView(
                    title: AppStrings.Profile.contactUs,
                    url: AppUrls.contactUs
                )
            }
            .navigationDestination(isPresented: $showTerm) {
                CommonWebView(
                    title: AppStrings.Profile.term,
                    url: AppUrls.terms
                )
            }
            .navigationDestination(isPresented: $showPrivacy) {
                CommonWebView(
                    title: AppStrings.Profile.privacy,
                    url: AppUrls.privacy
                )
            }
            .navigationDestination(isPresented: $showLicense) {
                LicenseListView()
            }
        }
    }
}

#Preview {
    ProfileView()
}
