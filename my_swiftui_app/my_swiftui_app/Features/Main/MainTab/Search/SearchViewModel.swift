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
    
    private let productRepository: ProductRepository = ProductRepositoryImpl()
    private let storeRepository: StoreRepository = StoreRepositoryImpl()
    private let couponRepository: CouponRepository = CouponRepositoryImpl()
    
    var favoriteProducts: [Product] {
        state.products.filter(\.isFavorite)
    }
    
    var favoriteCoupons: [Coupon] {
        state.coupons.filter(\.isFavorite)
    }
    
    var favoriteStores: [Store] {
        state.stores.filter(\.isFavorite)
    }
    
    init() {
        Task {
            await loadProducts()
            loadCoupons()
            loadStores()
        }
    }
    
    private func loadCoupons() {
        do {
            state.coupons = try couponRepository.getCoupons()
        } catch {
            print(error)
        }
    }
    
    private func loadProducts() async {
        do {
            state.products = try await productRepository.getProducts(page: 1)
        } catch {
            print(error)
        }
    }
    
    private func loadStores() {
        do {
            state.stores = try storeRepository.getStores()
        } catch {
            print(error)
        }
    }
    
    func toggleFavorite(id: String, type: FavoriteType, fallbackProduct: Product? = nil) {
        switch type {
        case .products:
            if let index = state.products.firstIndex(where: { $0.id == id }) {
                state.products[index].isFavorite.toggle()
            } else if var product = fallbackProduct {
                product.isFavorite.toggle()
                state.products.append(product)
            }
            
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
