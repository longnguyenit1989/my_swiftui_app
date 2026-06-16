//
//  CouponRepository.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

protocol StoreRepository {
    func getStores() throws -> [Store]
}
