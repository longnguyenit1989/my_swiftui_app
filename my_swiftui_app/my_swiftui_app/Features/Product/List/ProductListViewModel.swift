//
//  ProductListViewModel.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

import Foundation
import Combine

@MainActor
final class ProductListViewModel: PagingViewModel<Product> {

    private let repository: ProductRepository

    init(repository: ProductRepository) {

        self.repository = repository

        super.init(
            pageLoader: { [repository] page in
                try await repository.getProducts(page: page)
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

