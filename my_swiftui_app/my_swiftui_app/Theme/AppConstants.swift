//
//  AppConstants.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 9/6/26.
//

import CoreFoundation
import Foundation

enum AppConstants {
    static let borderWidth: CGFloat = 2

    static let imageItemHeight: CGFloat = 80
    static let imageDetailHeight: CGFloat = 140
    
    static let avatarSize: CGFloat = 48

    static let cardWidth: CGFloat = 180

    static let bannerHeight: CGFloat = 180

    static let iconButtonSize: CGFloat = 32
    static let iconIndicatorSize: CGFloat = 8
    static let iconCategorySize: CGFloat = 60

    static let radiusButton: CGFloat = 12
    static let buttonHeight: CGFloat = 48
}

enum AppUrls {
    static let contactUs = URL(string: "https://www.apple.com/contact/")!
    static let privacy = URL(string: "https://www.apple.com/legal/privacy/")!
    static let terms = URL(string: "https://www.apple.com/legal/internet-services/itunes/")!
}
