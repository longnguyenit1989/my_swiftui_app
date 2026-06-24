//
//  CouponRepository.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

protocol CouponRepository {
    func getCoupons(page: Int) async throws -> [Coupon]
}
