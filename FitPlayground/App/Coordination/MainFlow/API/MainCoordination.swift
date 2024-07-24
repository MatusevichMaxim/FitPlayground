//
//  MainCoordination.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/3/24.
//

import Combine

protocol MainCoordination: Coordination {
    var isWorkoutBuilderFlowPresented: ValueSubject<Bool> { get set }
    
    func launchWorkoutBuilderFlow()
}
