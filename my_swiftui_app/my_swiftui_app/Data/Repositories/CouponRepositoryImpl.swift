//
//  CouponRepositoryImpl.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

import Foundation

final class CouponRepositoryImpl: CouponRepository {
    func getCoupons(page: Int) async throws -> [Coupon] {
        
        try await Task.sleep(for: .seconds(1))
        
        let fileName: String
        
        switch page {
            
        case 1:
            fileName = "coupons"
            
        case 2:
            fileName = "coupons_1"
            
        default:
            return []
        }
        
        return try JsonLoader.load(
            fileName: fileName,
            type: [Coupon].self
        )
    }
}
