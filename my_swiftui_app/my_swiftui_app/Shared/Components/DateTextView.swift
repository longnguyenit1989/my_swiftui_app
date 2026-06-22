//
//  Untitled.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 22/6/26.
//

import SwiftUI

struct DateTextView: View {

    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "vi_VN")
        formatter.dateStyle = .full
        return formatter.string(from: Date())
    }

    var body: some View {
        Text(formattedDate)
    }
}
