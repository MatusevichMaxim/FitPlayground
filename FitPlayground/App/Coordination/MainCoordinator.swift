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
        let mainTabView = MainTabView(selectedTab: .home)
        setRootView(AnyView(mainTabView))
    }
}
