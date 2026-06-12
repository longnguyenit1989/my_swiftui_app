//
//  Image.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

import SwiftUI

extension Image {
    func cardImageStyle(height: CGFloat = AppConstants.imageItemHeight) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(height: height)
            .padding(.horizontal, AppSpacing.sm)
            .padding(.vertical, AppSpacing.sm)
            .frame(maxWidth: .infinity)
            .background(.white)
    }
}
