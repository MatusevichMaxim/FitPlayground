//
//  WorkoutBuilderViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/2/24.
//

import Foundation

final class WorkoutBuilderViewModel: ObservableObject {
    @Published var name: String = "My Workout 1"
    
    @Published var workout: Workout = .init(
        name: "",
        duration: 11,
        muscleGroups: [.chest, .back, .shoulders],
        status: .active
    )
}

extension WorkoutBuilderViewModel {
    
}