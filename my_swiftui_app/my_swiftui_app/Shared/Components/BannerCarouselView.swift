//
//  BannerCarouselView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 11/6/26.
//

import SwiftUI
import SwiftUIPager
import Combine

struct BannerCarouselView: View {
    
    @StateObject private var page = Page.first()
    
    let height: CGFloat
    let bannerItems = [
        "Banner 1",
        "Banner 2",
        "Banner 3",
        "Banner 4"
    ]
    
    private let timer = Timer.publish(
        every: 5,
        on: .main,
        in: .common
    ).autoconnect()
    
    init(height: CGFloat) {
        self.height = height
    }
    
    var body: some View {
        VStack(spacing: AppSpacing.sm) {
            ZStack {
                Pager(
                    page: page,
                    data: bannerItems,
                    id: \.self
                ) { item in
                    RoundedRectangle(cornerRadius: AppSpacing.sm)
                        .fill(AppColor.shared.primary.opacity(0.9))
                        .overlay {Text(item).font(.title2).foregroundStyle(.white)}
                }
                .itemSpacing(AppSpacing.xs)
                .onReceive(timer) { _ in
                    goToNextPage()
                }
                
                HStack {
                    Button {
                        goToPreviousPage()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .frame(width: AppConstants.iconButtonSize, height: AppConstants.iconButtonSize)
                            .background(.gray.opacity(0.5))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Button {
                        goToNextPage()
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                            .frame(width: AppConstants.iconButtonSize, height: AppConstants.iconButtonSize)
                            .background(.gray.opacity(0.5))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: height)
            
            // indicator
            HStack(spacing: AppSpacing.xs) {
                ForEach(bannerItems.indices, id: \.self) { index in
                    Circle()
                        .frame(
                            width: AppConstants.iconIndicatorSize,
                            height: AppConstants.iconIndicatorSize
                        )
                        .foregroundStyle(
                            page.index == index
                            ? AppColor.shared.primary
                            : .gray.opacity(0.3)
                        )
                }
            }
        }
    }
    
    private func goToNextPage() {
        withAnimation {
            let nextPage = (page.index + 1) % bannerItems.count
            page.update(.new(index: nextPage))
        }
    }
    
    private func goToPreviousPage() {
        withAnimation {
            let previousPage = (page.index - 1 + bannerItems.count) % bannerItems.count
            page.update(.new(index: previousPage))
        }
    }
}
