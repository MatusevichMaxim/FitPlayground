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
    
    init() {
        loadWorkouts()
    }
}

extension HomeTabViewModel {
    private func loadWorkouts() {
        workouts = PreviewData.workoutsPreset // TODO: temp
    }
}
