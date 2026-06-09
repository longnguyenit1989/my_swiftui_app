//
//  SearchViewModel.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 8/6/26.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var state = SearchState()
    
    init() {
        loadCoupons()
        loadProducts()
    }
    
    
    private func loadCoupons() {
        do {
            state.coupons = try Bundle.main.decode(
                [Coupon].self,
                from: "coupons"
            )
        } catch {
            print(error)
        }
    }
    
    private func loadProducts() {
        do {
            state.products = try Bundle.main.decode(
                [Product].self,
                from: "products"
            )
        } catch {
            print(error)
        }
    }
}
