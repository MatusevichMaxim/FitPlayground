//
//  FiltersManager.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/30/24.
//

import Foundation
import Combine

struct FilterModel: Identifiable {
    let id = UUID()
    let name: String
    let icon: AppImageResourse?
    let subfilters: [FilterModel]?
    
    init(muscleGroupFilter: MuscleGroupFilter) {
        name = muscleGroupFilter.localizedName
        icon = muscleGroupFilter.icon
        
        if let subfilters = muscleGroupFilter.subfilters {
            self.subfilters = subfilters.map { .init(muscleGroupFilter: $0) }
        } else {
            self.subfilters = nil
        }
    }
    
    init(equipmentFilter: EquipmentFilter) {
        name = equipmentFilter.localizedName
        icon = equipmentFilter.icon
        subfilters = nil
    }
}

final class FiltersManager {
    private(set) var muscleGroupModels: [FilterModel] = [
        .init(muscleGroupFilter: .any),
        .init(muscleGroupFilter: .abs),
        .init(muscleGroupFilter: .arms),
        .init(muscleGroupFilter: .back),
        .init(muscleGroupFilter: .chest),
        .init(muscleGroupFilter: .legs),
        .init(muscleGroupFilter: .shoulders)
    ]
    
    private(set) var equipmentModels: [FilterModel] = [
        .init(equipmentFilter: .any),
        .init(equipmentFilter: .no),
        .init(equipmentFilter: .barbell),
        .init(equipmentFilter: .dumbbell),
        .init(equipmentFilter: .machines),
        .init(equipmentFilter: .resistanceBand),
        .init(equipmentFilter: .kettlebell),
        .init(equipmentFilter: .cardio),
        .init(equipmentFilter: .other),
    ]
    
    @Published private var selectedFiltersCount: Int = 0
}

extension FiltersManager: FiltersProviding {
    var selectedFilters: ValuePublisher<Int> {
        $selectedFiltersCount.eraseToAnyPublisher()
    }
}
