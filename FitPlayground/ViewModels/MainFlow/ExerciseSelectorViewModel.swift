//
//  ExerciseSelectorViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 7/15/24.
//

import Foundation

final class ExerciseSelectorViewModel: ObservableObject {
    init(mainCoordinator: MainCoordination) {
        self.mainCoordinator = mainCoordinator
    }
    
    private let mainCoordinator: MainCoordination
}

extension ExerciseSelectorViewModel {
    
}
