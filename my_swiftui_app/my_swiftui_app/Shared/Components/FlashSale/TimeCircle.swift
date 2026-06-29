//
//  TimeCircle.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 29/6/26.
//

import SwiftUI

struct TimeCircle: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack(spacing: 2) {
            Text("\(value)")
                .font(.headline)
            
            Text(title)
                .font(.caption2)
                .foregroundStyle(AppColor.shared.textPrimary)
        }
        .frame(width: 44, height: 60)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 26)
        )
    }
}
