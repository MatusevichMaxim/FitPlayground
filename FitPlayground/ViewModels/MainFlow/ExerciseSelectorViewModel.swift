//
//  ExerciseSelectorViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/15/24.
//

import Foundation

final class ExerciseSelectorViewModel: ObservableObject {
    let filtersProvider: FiltersProviding
    
    @Published var exercises: [Exercise] = []
    
    init(
        coordinator: WorkoutBuilderCoordinator,
        filtersManager: FiltersManager,
        filtersProvider: FiltersProviding
    ) {
        self.coordinator = coordinator
        self.filtersManager = filtersManager
        self.filtersProvider = filtersProvider
        
        loadExercises()
    }
    
    private let coordinator: WorkoutBuilderCoordinator
    private let filtersManager: FiltersManager
}

extension ExerciseSelectorViewModel {
    func configureFiltersSelectorViewModel() -> FiltersSelectorViewModel {
        .init(filtersManager: filtersManager)
    }
}

extension ExerciseSelectorViewModel {
    private func loadExercises() {
        for _ in 0..<20 {
            exercises.append(.init(id: .init(), name: "Cable Hip Adduction", muscleGroups: [.abs, .arms]))
        }
    }
}
