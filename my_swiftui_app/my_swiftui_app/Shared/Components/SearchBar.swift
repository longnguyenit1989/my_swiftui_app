//
//  SearchBar.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 24/6/26.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    let placeholder: String

    var body: some View {
        HStack(spacing: 8) {
            TextField(placeholder.l10n, text: $text)
                .frame(maxWidth: .infinity)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)

            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }

            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
        }
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}
