//
//  FavoriteButton.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

import SwiftUI

struct FavoriteButton: View {
    let isFavorite: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(
                systemName: isFavorite
                ? "heart.fill"
                : "heart"
            )
            .font(.system(size: 18))
            .foregroundStyle(
                isFavorite ? AppColor.shared.primary : AppColor.shared.textTertiary
            )
        }
        .buttonStyle(.plain)
    }
}
