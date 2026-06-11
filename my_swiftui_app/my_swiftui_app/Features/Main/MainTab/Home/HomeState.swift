//
//  HomeState.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 11/6/26.
//

import Foundation

struct HomeState {
    var categories: [Category] = [
        (imageName: "tshirt", title: AppStrings.Home.clothes, isSelected: true),
        (imageName: "desktopcomputer", title: AppStrings.Home.electronics, isSelected: false),
        (imageName: "applewatch", title: AppStrings.Home.watches, isSelected: false),
        (imageName: "shoeprints.fill", title: AppStrings.Home.shoes, isSelected: false),
        (imageName: "bag.fill", title: AppStrings.Home.bags, isSelected: false),
        (imageName: "sparkles", title: AppStrings.Home.beauty, isSelected: false),
        (imageName: "figure.run", title: AppStrings.Home.sports, isSelected: false),
        (imageName: "book.fill", title: AppStrings.Home.books, isSelected: false),
        (imageName: "bed.double.fill", title: AppStrings.Home.furniture, isSelected: false),
        (imageName: "gamecontroller.fill", title: AppStrings.Home.toys, isSelected: false)
    ]
        .enumerated()
        .map { index, item in
            Category(
                id: "\(index + 1)",
                imageName: item.imageName,
                title: item.title,
                isSelected: item.isSelected
            )
        }
}
