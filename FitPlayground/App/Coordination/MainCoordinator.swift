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
        let homeTabViewModel = HomeTabViewModel()
        let calendarTabViewModel = CalendarTabViewModel()
        let workoutsTabViewModel = WorkoutsTabViewModel()
        
        let viewModel = MainTabViewModel(
            defaultSelectedTab: .home,
            homeTabViewModel: homeTabViewModel,
            calendarTabViewModel: calendarTabViewModel,
            workoutsTabViewModel: workoutsTabViewModel
        )
        let mainTabView = MainTabView(viewModel: viewModel)
        setRootView(AnyView(mainTabView))
    }
}
