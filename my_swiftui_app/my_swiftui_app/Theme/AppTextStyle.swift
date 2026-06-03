//
//  AppTextStyle.swift
//  jcb_app_ios
//
//  Created by OPN-Macbook on 3/6/26.
//

import SwiftUI

enum AppTextStyle {
    
    static let jp14Size: CGFloat = 14
    static let jp16Size: CGFloat = 16
    
    static func jp(
        size: CGFloat,
        weight: Font.Weight = .regular,
        italic: Bool = false
    ) -> Font {
        var font = Font.system(size: size, weight: weight)
        
        if italic {
            font = font.italic()
        }
        
        return font
    }
    
    static let jp14 = jp(size: jp14Size, weight: .regular)
    static let jp14Bold = jp(size: jp14Size, weight: .bold)
    
    static let jp16 = jp(size: jp16Size, weight: .regular)
}
