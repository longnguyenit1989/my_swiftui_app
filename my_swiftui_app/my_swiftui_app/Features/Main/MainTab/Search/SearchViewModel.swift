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
    
    private var allProducts: [Product] = []
    private var allCoupons: [Coupon] = []
    private var allStores: [Store] = []
    
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
            await loadCoupons()
            loadStores()
        }
    }
    
    private func loadCoupons() async {
        do {
            let coupons = try await couponRepository.getCoupons(page: 1)
            state.coupons = coupons
            allCoupons = coupons
        } catch {
            print(error)
        }
    }
    
    private func loadProducts() async {
        do {
            let products = try await productRepository.getProducts(page: 1)
            state.products = products
            allProducts = products
        } catch {
            print(error)
        }
    }
    
    private func loadStores() {
        do {
            let stores = try storeRepository.getStores()
            state.stores = stores
            allStores = stores
        } catch {
            print(error)
        }
    }
    
    func toggleFavorite(id: String, type: FavoriteType, fallbackProduct: Product? = nil) {
        switch type {
            
        case .products:
            if let index = allProducts.firstIndex(where: { $0.id == id }) {
                allProducts[index].isFavorite.toggle()
            } else if var product = fallbackProduct {
                product.isFavorite.toggle()
                allProducts.append(product)
            }
            applyFilter()
            
        case .coupons:
            if let index = allCoupons.firstIndex(where: { $0.id == id }) {
                allCoupons[index].isFavorite.toggle()
            }
            applyFilter()
            
        case .stores:
            if let index = allStores.firstIndex(where: { $0.id == id }) {
                allStores[index].isFavorite.toggle()
            }
            applyFilter()
        }
    }
    
    func search(keyword: String) {
        state.searchKeyword = keyword
        applyFilter()
    }
    
    private func applyFilter() {
        let keyword = state.searchKeyword.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !keyword.isEmpty else {
            state.products = allProducts
            state.coupons = allCoupons
            state.stores = allStores
            return
        }
        
        state.products = allProducts.filter {
            $0.title.matches(keyword)
        }
        
        state.coupons = allCoupons.filter {
            $0.title.matches(keyword)
        }
        
        state.stores = allStores.filter {
            $0.title.matches(keyword)
        }
    }
}

enum FavoriteType {
    case products
    case coupons
    case stores
}
