//
//  OnboardingCoordinator.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import SwiftUI

final class OnboardingCoordinator {
    private let setRootView: (AnyView) -> Void
    
    init(setRootView: @escaping (AnyView) -> Void) {
        self.setRootView = setRootView
    }
    
    private func finishOnboarding() {
        // TODO: haven't tested it yet
        let mainCoordinator = MainCoordinator(setRootView: setRootView)
        mainCoordinator.launch()
    }
}

extension OnboardingCoordinator: Coordination {
    func launch() {
        
    }
}
