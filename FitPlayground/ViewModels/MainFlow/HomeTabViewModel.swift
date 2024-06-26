//
//  HomeTabViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import Foundation
import Combine

final class HomeTabViewModel: ObservableObject {
    @Published var workouts: [Workout] = []
    
    init(
        dialogCoordinator: DialogCoordination
    ) {
        self.dialogCoordinator = dialogCoordinator
        
        loadWorkouts()
    }
    
    private let dialogCoordinator: DialogCoordination
}

extension HomeTabViewModel {
    func onAddNewWorkout() {
        dialogCoordinator.showCreateDialog()
    }
}

extension HomeTabViewModel {
    private func loadWorkouts() {
        workouts = [
            .init(name: "Core Engager 🎯", duration: 27, muscleGroups: [.abs, .back, .chest], status: .completed),
            .init(name: "Chair Rounds!", duration: 11, muscleGroups: [.legs, .back], status: .active),
            .init(name: "Leg Day", duration: 39, muscleGroups: [.legs], status: .active)
        ]
    }
}
