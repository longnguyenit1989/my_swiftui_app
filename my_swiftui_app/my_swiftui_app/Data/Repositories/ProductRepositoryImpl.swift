//
//  ProductRepositoryImpl.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

import Foundation

final class ProductRepositoryImpl: ProductRepository {
    func getProducts(page: Int) async throws -> [Product] {
        
        try await Task.sleep(for: .seconds(1))
        
        let fileName: String
        
        switch page {
            
        case 1:
            fileName = "products"
            
        case 2:
            fileName = "products_1"
            
        default:
            return []
        }
        
        return try JsonLoader.load(
            fileName: fileName,
            type: [Product].self
        )
    }
    
    func getFlashSaleProducts(page: Int) async throws -> [Product] {
        
        try await Task.sleep(for: .seconds(1))
        
        let fileName: String
        
        switch page {
            
        case 1:
            fileName = "flash_sale_products"
            
        case 2:
            fileName = "flash_sale_products_1"
            
        default:
            return []
        }
        
        return try JsonLoader.load(
            fileName: fileName,
            type: [Product].self
        )
    }
}
