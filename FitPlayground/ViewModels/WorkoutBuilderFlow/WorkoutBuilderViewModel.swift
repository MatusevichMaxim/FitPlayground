//
//  WorkoutBuilderViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/2/24.
//

import Foundation
import Combine

final class WorkoutBuilderViewModel: ObservableObject {
    @Published var name: String = "My Workout 1"
    @Published var workout: Workout = .init(
        name: "",
        duration: 11,
        muscleGroups: [.chest, .back, .shoulders],
        status: .active
    )
    
    var routingAction = PassthroughSubject<RoutingAction, Never>()
    
    init(coordinator: WorkoutBuilderCoordination) {
        self.coordinator = coordinator
    }
    
    private let coordinator: WorkoutBuilderCoordination
}

extension WorkoutBuilderViewModel {
    func onCloseTapped() {
        coordinator.end()
    }
    
    func onAddExerciseTapped() {
        coordinator.openExerciseSelector()
    }
}

extension WorkoutBuilderViewModel: Routing {
    func perform(action: RoutingAction) {
        routingAction.send(action)
    }
}
