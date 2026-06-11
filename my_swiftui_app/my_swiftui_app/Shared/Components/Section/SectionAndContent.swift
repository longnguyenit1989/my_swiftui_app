//
//  SectionAndContent.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 10/6/26.
//

import SwiftUI

struct SectionAndContent<Content: View>: View {
    let title: String
    let action: (() -> Void)?
    let content: Content?

    init(
        title: String,
        action: (() -> Void)? = nil,
        content: () -> Content?
    ) {
        self.title = title
        self.action = action
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading) {
            SectionTitleView(
                title: title,
                action: action
            )
            content
        }
    }
}
