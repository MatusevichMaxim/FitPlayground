//
//  MainCoordinator.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import SwiftUI

final class MainCoordinator {
    private let setRootView: (AnyView) -> Void
    
    init(setRootView: @escaping (AnyView) -> Void) {
        self.setRootView = setRootView
    }
}

extension MainCoordinator: Coordination {
    func launch() {
        let viewModel = MainTabViewModel()
        let mainTabView = MainTabView(viewModel: viewModel)
        setRootView(AnyView(mainTabView))
    }
}
