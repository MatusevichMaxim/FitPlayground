//
//  FiltersManager.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

import Foundation

final class FiltersManager {
    var muscleGroupFilterStateModels: [FilterStateModel<MuscleGroupFilter>] = []
    var equipmentFilterStateModels: [FilterStateModel<EquipmentFilter>] = []
    
    init() {
        fetchFilters()
    }
}

extension FiltersManager {
    private func fetchFilters() {
        
    }
}
