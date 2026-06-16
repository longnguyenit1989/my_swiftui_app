//
//  PagingFooter.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 18/6/26.
//

import SwiftUI

struct PagingFooter: View {
    let isLoading: Bool
    
    var body: some View {
        if isLoading {
            ProgressView().tint(AppColor.shared.gray)
                .padding()
        }
    }
}
