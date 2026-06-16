//
//  JsonLoader.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

import Foundation

enum JsonLoader {
    static func load<T: Decodable>(
        fileName: String,
        type: T.Type
    ) throws -> T {
        guard let url = Bundle.main.url(
            forResource: fileName,
            withExtension: "json"
        ) else {
            throw NSError(
                domain: "JsonLoader",
                code: 404,
                userInfo: [
                    NSLocalizedDescriptionKey: "Missing file \(fileName).json"
                ]
            )
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
