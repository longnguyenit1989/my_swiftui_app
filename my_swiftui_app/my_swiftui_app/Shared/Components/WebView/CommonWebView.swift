//
//  WebViewScreen.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 10/6/26.
//

import SwiftUI

struct CommonWebView: View {
    let title: String
    let url: URL

    var body: some View {
        AppWebView(url: url)
            .navigationTitle(title.l10n)
            .navigationBarTitleDisplayMode(.inline)
            .hideBottomBar()
    }
}
