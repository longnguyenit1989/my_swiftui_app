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
    @StateObject private var languageManager = LanguageManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
                .environmentObject(languageManager)
                .environment(\.locale, languageManager.locale)
                .id(languageManager.locale.identifier)
        }
    }
}
