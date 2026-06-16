//
//  CouponRepositoryImpl.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

import Foundation

final class StoreRepositoryImpl: StoreRepository {
    func getStores() throws -> [Store] {
        try Bundle.main.decode(
            [Store].self,
            from: "stores"
        )
    }
}
