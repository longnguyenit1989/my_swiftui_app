//
//  HomeViewModel.swift
//  my_swiftui_app
//
//  Created by OPN-Macbook on 11/6/26.
//

import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var state = HomeState()
    
    func selectCategory(id: String) {
        for index in state.categories.indices {
            state.categories[index].isSelected = state.categories[index].id == id
        }
    }
}
