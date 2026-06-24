//
//  SearchState.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 8/6/26.
//

import Foundation

struct SearchState {
    var searchKeyword: String = ""
    
    var coupons: [Coupon] = []
    var products: [Product] = []
    var stores: [Store] = []
}
