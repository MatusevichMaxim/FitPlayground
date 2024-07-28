//
//  ExerciseSelectorViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/15/24.
//

import Foundation

final class ExerciseSelectorViewModel: ObservableObject {
    init(coordinator: WorkoutBuilderCoordinator) {
        self.coordinator = coordinator
    }
    
    private let coordinator: WorkoutBuilderCoordinator
}

extension ExerciseSelectorViewModel {
    
}
