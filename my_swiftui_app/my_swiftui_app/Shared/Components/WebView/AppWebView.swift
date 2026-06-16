//
//  AppWebView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 10/6/26.
//

import SwiftUI
import WebKit

struct AppWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }
    
    func updateUIView(
        _ webView: WKWebView,
        context: Context
    ) {
        guard webView.url != url else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
}
