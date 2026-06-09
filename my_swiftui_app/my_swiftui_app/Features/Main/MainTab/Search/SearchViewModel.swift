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
        loadStores()
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
    
    private func loadStores() {
        do {
            state.stores = try Bundle.main.decode(
                [Store].self,
                from: "stores"
            )
        } catch {
            print(error)
        }
    }
    
    func toggleFavorite(id: String, type: FavoriteType) {
        switch type {
        case .products:
            guard let index = state.products.firstIndex(where: { $0.id == id }) else {
                return
            }
            state.products[index].isFavorite.toggle()

        case .coupons:
            guard let index = state.coupons.firstIndex(where: { $0.id == id }) else {
                return
            }
            state.coupons[index].isFavorite.toggle()

        case .stores:
            guard let index = state.stores.firstIndex(where: { $0.id == id }) else {
                return
            }
            state.stores[index].isFavorite.toggle()
        }
    }
}

enum FavoriteType {
    case products
    case coupons
    case stores
}
