//
//  Untitled.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

import Foundation

struct PagingState<T: Identifiable> {
    var displayedItems: [T] = []
    var currentPage: Int = 0
    
    var isRefreshing = false
    var isLoadingMore = false
    
    var hasMoreData = true
    
    var isInitialLoading: Bool {
        displayedItems.isEmpty && isRefreshing
    }
}
