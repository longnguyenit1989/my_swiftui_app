//
//  MyApp.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 4/6/26.
//

import SwiftUI

@main
struct MyApp: App {

    @StateObject private var session = SessionManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
        }
    }
}
