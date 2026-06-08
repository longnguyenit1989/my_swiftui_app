//
//  Bundle.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 8/6/26.
//

import Foundation

extension Bundle {
    var appVersion: String {
        infoDictionary?["CFBundleShortVersionString"] as? String ?? "-"
    }
    
    var buildNumber: String {
        infoDictionary?["CFBundleVersion"] as? String ?? "-"
    }
    
    var versionWithBuild: String {
        "\(appVersion) (\(buildNumber))"
    }
}
