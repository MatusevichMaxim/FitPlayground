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
    
    init(dialogCoordinator: DialogCoordination) {
        self.dialogCoordinator = dialogCoordinator
        
        loadWorkouts()
    }
    
    private let dialogCoordinator: DialogCoordination
}

extension HomeTabViewModel {
    func onItemTapped(isDone: Bool) {
        dialogCoordinator.showDialog(type: .activityOption(isDone: isDone))
    }
    
    func onAddNewWorkout() {
        dialogCoordinator.showDialog(type: .createNew)
    }
}

extension HomeTabViewModel {
    private func loadWorkouts() {
        workouts = PreviewData.workoutsPlanPreset
    }
}
