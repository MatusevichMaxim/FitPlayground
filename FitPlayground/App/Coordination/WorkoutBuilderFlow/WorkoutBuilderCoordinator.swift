//
//  WorkoutBuilderCoordinator.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/24/24.
//

final class WorkoutBuilderCoordinator {
    var router: Routing?
    
    init(isWorkoutBuilderFlowPresented: ValueSubject<Bool>) {
        self.isWorkoutBuilderFlowPresented = isWorkoutBuilderFlowPresented
    }
    
    private var isWorkoutBuilderFlowPresented: ValueSubject<Bool>
}

extension WorkoutBuilderCoordinator: WorkoutBuilderCoordination {
    func launch() {
        isWorkoutBuilderFlowPresented.send(true)
    }
    
    func end() {
        isWorkoutBuilderFlowPresented.send(false)
    }
    
    func openExerciseSelector() {
        router?.perform(action: .push(destination: WorkoutFlowDestination.exerciseSelector))
    }
}
