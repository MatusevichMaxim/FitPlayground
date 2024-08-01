//
//  FiltersSelectorViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

import Foundation

final class FiltersSelectorViewModel: ObservableObject {
    let filtersManager: FiltersManager
    
    init(filtersManager: FiltersManager) {
        self.filtersManager = filtersManager
    }
}
