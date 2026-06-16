//
//  PagingViewModel.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 16/6/26.
//

import Foundation
import Combine

@MainActor
class PagingViewModel<T: Identifiable>: BaseViewModel {
    
    typealias PageLoader = (Int) async throws -> [T]
    
    private let pageLoader: PageLoader
    
    @Published var pagingState = PagingState<T>()
    
    init(
        pageLoader: @escaping PageLoader
    ) {
        self.pageLoader = pageLoader
    }
    
    func refresh() async {
        guard !pagingState.isRefreshing else { return }
        guard !pagingState.isLoadingMore else { return }
        
        pagingState.isRefreshing = true
        pagingState.hasMoreData = true
        
        defer {
            pagingState.isRefreshing = false
        }
        
        do {
            let items = try await pageLoader(1)
            
            pagingState.displayedItems = items
            pagingState.currentPage = 1
            pagingState.hasMoreData = !items.isEmpty
            
        } catch is CancellationError {
            return
        }
        
        catch {
            setError(
                title: AppStrings.Error.error,
                message: error.localizedDescription
            )
        }
    }
    
    func loadMore() async {
        guard !pagingState.isRefreshing else { return }
        guard pagingState.hasMoreData else { return }
        guard !pagingState.isLoadingMore else { return }
        
        pagingState.isLoadingMore = true
        
        defer {
            pagingState.isLoadingMore = false
        }
        
        do {
            let nextPage = pagingState.currentPage + 1
            
            let items = try await pageLoader(nextPage)
            
            if items.isEmpty {
                pagingState.hasMoreData = false
                return
            }
            
            pagingState.displayedItems.append(
                contentsOf: items
            )
            
            pagingState.currentPage = nextPage
            
        } catch is CancellationError {
            return
        } catch {
            setError(
                title: AppStrings.Error.error,
                message: error.localizedDescription
            )
            
            pagingState.hasMoreData = false
        }
    }
    
    func loadMoreIfNeeded(for item: T) async {
        guard item.id == pagingState.displayedItems.last?.id else {
            return
        }
        
        await loadMore()
    }
}
