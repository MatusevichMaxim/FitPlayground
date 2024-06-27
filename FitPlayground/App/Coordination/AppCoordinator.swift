//
//  AppCoordinator.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import SwiftUI

final class AppCoordinator {
    init(window: UIWindow) {
        self.window = window
    }
    
    private var window: UIWindow
    private let isOnboardingCompleted = true
}

extension AppCoordinator: Coordination {
    func launch() {
        if isOnboardingCompleted {
            showMainFlow()
        } else {
            showOnboardingFlow()
        }
    }
}

extension AppCoordinator {
    private func showOnboardingFlow() {
        let onboardingCoordinator = OnboardingCoordinator(setRootView: setRootView)
        onboardingCoordinator.launch()
    }
    
    private func showMainFlow() {
        let mainCoordinator = MainCoordinator(setRootView: setRootView)
        mainCoordinator.launch()
    }
    
    private func setRootView<V: View>(view: V) {
        window.rootViewController = UIHostingController(rootView: view)
        window.makeKeyAndVisible()
    }
}
