//
//  MainCoordinator.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import SwiftUI

final class MainCoordinator {
    init(setRootView: @escaping (AnyView) -> Void) {
        self.setRootView = setRootView
    }
    
    private let setRootView: (AnyView) -> Void
    private var actionSheetViewModel: ActionSheetViewModel?
}

extension MainCoordinator: Coordination {
    func launch() {
        actionSheetViewModel = ActionSheetViewModel(elements: PreviewData.actionSheetCreateNew)
        
        let homeTabViewModel = HomeTabViewModel()
        let calendarTabViewModel = CalendarTabViewModel()
        let workoutsTabViewModel = WorkoutsTabViewModel()
        
        let viewModel = MainTabViewModel(
            defaultSelectedTab: .home,
            homeTabViewModel: homeTabViewModel,
            calendarTabViewModel: calendarTabViewModel,
            workoutsTabViewModel: workoutsTabViewModel,
            actionSheetViewModel: actionSheetViewModel!
        )
        let mainTabView = MainTabView(viewModel: viewModel)
        setRootView(AnyView(mainTabView))
    }
}

extension MainCoordinator: DialogCoordination {
    func showCreateDialog() {
        actionSheetViewModel?.isVisible = true
    }
    
    func hideDialog() {
        actionSheetViewModel?.isVisible = false
    }
}
