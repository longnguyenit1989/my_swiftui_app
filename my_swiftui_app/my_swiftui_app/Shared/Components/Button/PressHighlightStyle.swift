//
//  PressHighlightStyle.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

struct PressHighlightStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                configuration.isPressed
                ? Color.gray.opacity(0.12)
                : Color.clear
            )
    }
}
