//
//  WorkoutBuilderCoordinator.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/24/24.
//

final class WorkoutBuilderCoordinator {
    init(isWorkoutBuilderPresented: ValueSubject<Bool>) {
        self.isWorkoutBuilderPresentedValue = isWorkoutBuilderPresented
    }
    
    private var isWorkoutBuilderPresentedValue: ValueSubject<Bool>
}

extension WorkoutBuilderCoordinator: WorkoutBuilderCoordination {
    func launch() {
        isWorkoutBuilderPresentedValue.send(true)
    }
    
    func end() {
        isWorkoutBuilderPresentedValue.send(false)
    }
}
