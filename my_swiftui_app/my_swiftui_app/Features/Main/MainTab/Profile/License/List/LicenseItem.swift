//
//  LicenseItem.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 19/6/26.
//

import Foundation

// MARK: - Package.resolved JSON structure

struct PackageResolved: Decodable {
    let pins: [Pin]
    let version: Int

    struct Pin: Decodable {
        let identity: String
        let kind: String
        let location: String
        let state: State

        struct State: Decodable {
            let revision: String?
            let version: String?
        }
    }
}

// MARK: - Display model

struct LicenseItem: Identifiable, Hashable {
    let id: String
    let name: String
    let version: String
    let repositoryURL: String
    let licenseType: String

    init(pin: PackageResolved.Pin) {
        self.id = pin.identity
        self.name = pin.identity
            .split(separator: "-")
            .map { $0.capitalized }
            .joined(separator: "")
        self.version = pin.state.version ?? "N/A"
        self.repositoryURL = pin.location
        self.licenseType = "MIT License"
    }
}

// MARK: - Loader

enum LicenseLoader {
    static func load() -> [LicenseItem] {
        guard let url = Bundle.main.url(
            forResource: "Package",
            withExtension: "resolved"
        ) else {
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let resolved = try JSONDecoder().decode(
                PackageResolved.self, from: data
            )
            return resolved.pins.map { LicenseItem(pin: $0) }
        } catch {
            return []
        }
    }
}
