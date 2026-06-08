//
//  SearchView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct SearchView: View {
    @StateObject
    private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    section(title: AppStrings.Common.product, action: {
                        
                    }) {
                        Text("")
                    }
                    
                    section(title: AppStrings.Common.coupon, action: {
                        
                    }) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 12) {
                                ForEach(viewModel.state.coupons) { coupon in
                                    CouponItemView(coupon: coupon)
                                }
                            }
                        }
                    }
                    
                    section(title: AppStrings.Common.store, action: {
                        
                    }) {
                        Text("")
                    }
                }
            }
            .padding()
            .navigationTitle(Text(AppStrings.Main.search.l10n))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private func section<Content: View>(
        title: String,
        action: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading) {
            SectionTitleView(
                title: title,
                action: action
            )
            content()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}
