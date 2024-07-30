//
//  FiltersManager.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

import Combine

final class FiltersManager {
    private(set) var muscleGroupFilterStateModels: [FilterStateModel<MuscleGroupFilter>] = []
    private(set) var equipmentFilterStateModels: [FilterStateModel<EquipmentFilter>] = []
    
    init() {
        fetchFilters()
    }
    
    @Published private var selectedFiltersCount: Int = 0
}

extension FiltersManager {
    private func fetchFilters() {
        MuscleGroupFilter.allCases.forEach {
            muscleGroupFilterStateModels.append(.init(filter: $0, isSelected: false))
        }
        
        EquipmentFilter.allCases.forEach {
            equipmentFilterStateModels.append(.init(filter: $0, isSelected: false))
        }
    }
}

extension FiltersManager: FiltersProviding {
    var selectedFilters: ValuePublisher<Int> {
        $selectedFiltersCount.eraseToAnyPublisher()
    }
}
