//
//  Product.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

struct Product: Identifiable, Codable, Hashable {
    let id: String
    let imageName: String
    let price: Int
    let title: String
    let des: String
    let storeName: String
    let starCount: Double
    
    var isFavorite: Bool

    init(
        id: String,
        imageName: String,
        price: Int,
        title: String,
        storeName: String,
        des: String,
        starCount: Double,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.imageName = imageName
        self.price = price
        self.title = title
        self.des = des
        self.storeName = storeName
        self.starCount = starCount
        self.isFavorite = isFavorite
    }
}
