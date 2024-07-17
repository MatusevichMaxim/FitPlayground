//
//  MainCoordination.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/3/24.
//

protocol MainCoordination: Coordination {
    var isWorkoutBuilderPresented: ValueSubject<Bool> { get set }
    var isExerciseSelectorPresented: ValueSubject<Bool> { get set }
}
