//
//  HorizontalSection.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 10/6/26.
//

import SwiftUI

struct HorizontalSection<Item: Identifiable, Content: View>: View {
    let items: [Item]
    let spacing: CGFloat
    let content: (Item) -> Content

    init(
        items: [Item],
        spacing: CGFloat = AppSpacing.paddingItem,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: spacing) {
                ForEach(items) { item in
                    content(item)
                }
            }
        }
    }
}
