//
//  Image.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

import SwiftUI

extension Image {
    func cardImageStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(height: AppConstants.imageHeight)
            .padding(.horizontal, AppSpacing.sm)
            .padding(.vertical, AppSpacing.sm)
            .frame(maxWidth: .infinity)
            .background(.white)
    }
}
