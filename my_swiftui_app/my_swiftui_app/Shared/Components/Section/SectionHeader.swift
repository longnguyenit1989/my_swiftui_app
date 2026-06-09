//
//  SectionHeader.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    let height: CGFloat

    init(title: String, height: CGFloat = 45) {
        self.title = title
        self.height = height
    }

    var body: some View {
        VStack(spacing: 0) {

            Spacer(minLength: 0)

            Text(title.l10n)
                .textJp14Bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 0)

            Rectangle()
                .fill(AppColor.shared.border)
                .frame(height: AppConstants.borderWidth)
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
    }
}

#Preview {
    SectionHeader(title: "test")
}
