//
//  ThemeManager.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 22/6/26.
//

import SwiftUI
import Combine

final class ThemeManager: ObservableObject {
    
    @Published var isDarkMode = false
    
    var colorScheme: ColorScheme? {
        isDarkMode ? .dark : .light
    }
}
