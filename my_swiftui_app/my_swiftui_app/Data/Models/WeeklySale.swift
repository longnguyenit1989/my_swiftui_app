//
//  WeeklySale.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 24/6/26.
//

import Foundation

struct WeeklySale: Identifiable {
    let id = UUID()
    let dayKey: String
    let sales: Int
}
