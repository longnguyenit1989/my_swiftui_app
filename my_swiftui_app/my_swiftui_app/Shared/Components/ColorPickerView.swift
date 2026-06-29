//
//  ColorPickerView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 29/6/26.
//

import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selectedColor: ProductColor
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(ProductColor.allCases, id: \.self) { item in
                Button {
                    selectedColor = item
                } label: {
                    Circle()
                        .fill(item.color)
                        .frame(width: 28, height: 28)
                        .overlay {
                            Circle()
                                .stroke(
                                    selectedColor == item
                                    ? selectedColor.color
                                    : .clear,
                                    lineWidth: 2
                                )
                                .padding(-4)
                        }
                }
            }
        }
    }
}
