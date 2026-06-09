//
//  Product.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

struct Product: Identifiable, Codable {
    let id: String
    let imageName: String
    let title: String
    let des: String
    let storeName: String
    let starCount: Double

    init(
        id: String,
        imageName: String,
        title: String,
        storeName: String,
        des: String,
        starCount: Double,
    ) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.des = des
        self.storeName = storeName
        self.starCount = starCount
    }
}
