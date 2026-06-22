//
//  Date.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 22/6/26.
//

import Foundation

extension FormatStyle where Self == Date.FormatStyle {
    static var fullDate: Date.FormatStyle {
        Date.FormatStyle()
            .weekday(.wide)
            .day()
            .month(.wide)
            .year()
    }
}

