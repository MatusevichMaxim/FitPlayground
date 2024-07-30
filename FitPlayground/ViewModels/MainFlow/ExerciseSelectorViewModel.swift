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
        filtersProvider: FiltersProviding
    ) {
        self.coordinator = coordinator
        self.filtersProvider = filtersProvider
        
        loadExercises()
    }
    
    private let coordinator: WorkoutBuilderCoordinator
}

extension ExerciseSelectorViewModel {
    private func loadExercises() {
        for _ in 0..<20 {
            exercises.append(.init(id: .init(), name: "Cable Hip Adduction", muscleGroups: [.abs, .arms]))
        }
    }
}
