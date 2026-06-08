//
//  ContentView.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var session: SessionManager

    var body: some View {
        Group {
            if session.isAuthenticated {
                MainTabView()
            } else {
                SignInView()
            }
        }
        .animation(.default, value: session.isAuthenticated)
    }
}

#Preview {
    ContentView()
}
