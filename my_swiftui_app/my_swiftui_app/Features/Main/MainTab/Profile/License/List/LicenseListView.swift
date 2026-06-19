//
//  LicenseListView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 19/6/26.
//

import SwiftUI

struct LicenseListView: View {
    @State private var libraries: [LicenseItem] = []
    @State private var expandedItemId: String?
    
    @State private var selectedItem: LicenseItem?
    @State private var showWebView = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                if libraries.isEmpty {
                    Text("No third-party libraries found.")
                        .textJp14Secondary()
                        .padding(.top, AppSpacing.xxl)
                } else {
                    ForEach(libraries) { item in
                        licenseRow(item)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(AppStrings.Profile.license.l10n)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(item: $selectedItem) { item in
            if let url = URL(string: item.repositoryURL) {
                CommonWebView(
                    title: item.name,
                    url: url
                )
            }
        }
        .hideBottomBar()
        .onAppear {
            libraries = LicenseLoader.load()
        }
    }
    
    @ViewBuilder
    private func licenseRow(_ item: LicenseItem) -> some View {
        let isExpanded = expandedItemId == item.id
        
        VStack(spacing: 0) {
            // Header row
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    expandedItemId = isExpanded ? nil : item.id
                }
            } label: {
                HStack(spacing: AppSpacing.sm) {
                    VStack(alignment: .leading, spacing: AppSpacing.xxs) {
                        Text(item.name)
                            .textJp14Bold()
                        
                        Text("v\(item.version)")
                            .textJp12Secondary()
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(AppColor.shared.primary)
                        .font(.system(size: 12, weight: .medium))
                        .rotationEffect(.degrees(isExpanded ? 90 : 0))
                        .animation(.easeInOut(duration: 0.25), value: isExpanded)
                }
                .frame(maxWidth: .infinity)
                .frame(minHeight: 52)
                .contentShape(Rectangle())
            }
            .buttonStyle(PressHighlightStyle())
            
            // Expanded detail
            if isExpanded {
                VStack(alignment: .leading, spacing: AppSpacing.xs) {
                    detailRow(label: "License", value: item.licenseType)
                    
                    Button {
                        selectedItem = item
                        showWebView = true
                    } label: {
                        HStack(spacing: AppSpacing.xxs) {
                            Image(systemName: "link")
                                .font(.system(size: 12))

                            Text(item.repositoryURL)
                                .font(AppTextStyle.jp12)
                                .singleLine()
                        }
                        .foregroundColor(AppColor.shared.primary)
                    }
                }
                .padding(.vertical, AppSpacing.xs)
                .padding(.horizontal, AppSpacing.xs)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(AppColor.shared.primaryLight)
                .cornerRadius(AppSpacing.xs)
                .padding(.bottom, AppSpacing.xs)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
            
            // Divider
            Rectangle()
                .fill(AppColor.shared.border)
                .frame(height: AppConstants.borderWidth)
        }
    }
    
    @ViewBuilder
    private func detailRow(label: String, value: String) -> some View {
        HStack(spacing: AppSpacing.xxs) {
            Text(label + ":")
                .textJp12Secondary()
            Text(value)
                .textJp12()
        }
    }
}

#Preview {
    NavigationStack {
        LicenseListView()
    }
}
