//
//  CouponRepositoryImpl.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

import Foundation

final class CouponRepositoryImpl: CouponRepository {
    func getCoupons() throws -> [Coupon] {
        try Bundle.main.decode(
            [Coupon].self,
            from: "coupons"
        )
    }
}
