//
//  Coupon.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 8/6/26.
//

import Foundation

struct Coupon: Identifiable, Codable {
    let id: String
    let imageName: String
    let title: String
    let storeName: String
    let discountText: String
    let expirationDate: String

    init(
        id: String,
        imageName: String,
        title: String,
        storeName: String,
        discountText: String,
        expirationDate: String
    ) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.storeName = storeName
        self.discountText = discountText
        self.expirationDate = expirationDate
    }
}
