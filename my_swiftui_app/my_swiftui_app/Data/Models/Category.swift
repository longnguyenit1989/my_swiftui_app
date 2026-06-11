//
//  Category.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 11/6/26.
//

import Foundation

struct Category: Identifiable, Codable {
    let id: String
    let imageName: String
    let title: String
    
    var isSelected: Bool

    init(
        id: String,
        imageName: String,
        title: String,
        isSelected: Bool = false
    ) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.isSelected = isSelected
    }
}
