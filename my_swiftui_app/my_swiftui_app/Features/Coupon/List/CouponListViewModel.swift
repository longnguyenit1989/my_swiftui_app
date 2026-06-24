//
//  CouponListViewModel.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 23/6/26.
//

import Foundation
import Combine

@MainActor
final class CouponListViewModel: PagingViewModel<Coupon> {

    private let repository: CouponRepository

    init(repository: CouponRepository) {

        self.repository = repository

        super.init(
            pageLoader: { [repository] page in
                try await repository.getCoupons(page: page)
            }
        )
    }

    convenience init() {
        self.init(repository: CouponRepositoryImpl())
    }
    
    func loadInitial() async {
        guard pagingState.displayedItems.isEmpty else { return }
        await refresh()
    }
}
