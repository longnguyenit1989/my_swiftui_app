//
//  RatingBar.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

import SwiftUI

struct RatingBar: View {
    let rating: Double
    let maxRating: Int
    let size: CGFloat
    
    init(
        rating: Double,
        maxRating: Int = 5,
        size: CGFloat = 16
    ) {
        self.rating = rating
        self.maxRating = maxRating
        self.size = size
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<maxRating, id: \.self) { index in
                Image(
                    systemName: Double(index) < rating
                    ? "star.fill"
                    : "star"
                )
                .font(.system(size: size))
                .foregroundStyle(
                    Double(index) < rating
                    ? AppColor.shared.primary
                    : AppColor.shared.border
                )
            }
        }
    }
}
