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
    
    let exerciseSelectorViewModel: ExerciseSelectorViewModel
    var routingAction = PassthroughSubject<RoutingAction<WorkoutFlowDestination>, Never>()
    
    init(
        coordinator: WorkoutBuilderCoordination,
        exerciseSelectorViewModel: ExerciseSelectorViewModel
    ) {
        self.coordinator = coordinator
        self.exerciseSelectorViewModel = exerciseSelectorViewModel
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
    func perform<T>(action: RoutingAction<T>) where T : Destination {
        guard let action = action as? RoutingAction<WorkoutFlowDestination> else { return }
        
        routingAction.send(action)
    }
}
