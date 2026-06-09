//
//  Store.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

struct Store: Identifiable, Codable {
    let id: String
    let imageName: String
    let title: String
    let des: String
    
    var isFavorite: Bool

    init(
        id: String,
        imageName: String,
        title: String,
        des: String,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.des = des
        self.isFavorite = isFavorite
    }
}
