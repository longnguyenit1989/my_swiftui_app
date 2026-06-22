//
//  SectionToggle.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 22/6/26.
//

import SwiftUI

struct SectionToggle: View {
    @Binding var isOn: Bool

    var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .scaleEffect(0.6)
            .frame(width: 44)
    }
}
