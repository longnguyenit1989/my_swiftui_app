//
//  FlashSaleViewModel.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 29/6/26.
//

import Foundation
import Combine

@MainActor
final class FlashSaleViewModel: PagingViewModel<Product> {
    
    @Published var selectedDiscount = 0

    private let repository: ProductRepository
    
    var filteredProducts: [Product] {
        guard selectedDiscount > 0 else {
            return pagingState.displayedItems
        }
        return pagingState.displayedItems.filter {
            ($0.discount ?? 8) == selectedDiscount
        }
    }

    init(repository: ProductRepository) {

        self.repository = repository

        super.init(
            pageLoader: { [repository] page in
                try await repository.getFlashSaleProducts(page: page)
            }
        )
    }

    convenience init() {
        self.init(repository: ProductRepositoryImpl())
    }
    
    func loadInitial() async {
        guard pagingState.displayedItems.isEmpty else { return }
        await refresh()
    }
}
