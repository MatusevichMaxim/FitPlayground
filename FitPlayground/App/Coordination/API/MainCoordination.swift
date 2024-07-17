//
//  MainCoordination.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/3/24.
//

import Combine

protocol MainCoordination: Coordination {
    var isExerciseSelectorPresented: ValueSubject<Bool> { get set }
    
    func navigate(to destination: NavigationDestination)
    func navigateBack()
    func navigateToRoot()
}
