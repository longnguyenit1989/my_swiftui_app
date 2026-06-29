//
//  Untitled.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

protocol ProductRepository {
    func getProducts(page: Int) async throws -> [Product]
    func getFlashSaleProducts(page: Int) async throws -> [Product]
}
