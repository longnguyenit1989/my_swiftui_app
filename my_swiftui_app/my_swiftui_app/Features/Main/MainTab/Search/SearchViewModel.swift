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

    init() {
        loadCoupons()
    }

    private func loadCoupons() {
        guard
            let url = Bundle.main.url(
                forResource: "coupons",
                withExtension: "json"
            )
        else {
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let coupons = try JSONDecoder().decode(
                [Coupon].self,
                from: data
            )

            state.coupons = coupons
        } catch {
            print(error)
        }
    }
}
