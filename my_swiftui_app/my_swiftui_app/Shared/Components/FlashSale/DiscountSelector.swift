//
//  DiscountSelector.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 29/6/26.
//

import SwiftUI

struct DiscountSelector: View {
    let values: [Int]

    @Binding var selected: Int

    var body: some View {

        HStack(spacing: 0) {

            ForEach(values, id: \.self) { value in
                Button {
                    selected = (selected == value) ? 0 : value
                } label: {
                    Text("\(value)%")
                        .fontWeight(.medium)
                        .foregroundStyle(selected == value ? .white : .black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 38)
                        .background(
                            RoundedRectangle(cornerRadius: 19)
                                .fill(
                                    selected == value
                                    ? AppColor.shared.primary
                                    : .clear
                                )
                        )
                }
            }
        }
        .padding(4)
        .background(.white)
        .clipShape(Capsule())
    }
}
