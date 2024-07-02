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
    private let actionSheetManager = ActionSheetManager()
    private var actionSheetViewModel: ActionSheetViewModel?
}

extension MainCoordinator: Coordination {
    func launch() {
        actionSheetViewModel = ActionSheetViewModel()
        
        let homeTabViewModel = HomeTabViewModel(dialogCoordinator: self)
        let calendarTabViewModel = CalendarTabViewModel(dialogCoordinator: self)
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
    func showDialog(type: DialogType) {
        var builder: ActionSheetBuilder
        
        switch type {
        case .createNew:
            builder = CreateNewActionSheetBuilder()
        case .activityOption(let isDone):
            builder = ActivityOptionActionSheetBuilder(isDone: isDone)
        }
        
        actionSheetViewModel?.elements = actionSheetManager.create(using: builder)
        actionSheetViewModel?.isVisible = true
    }
    
    func hideDialog() {
        actionSheetViewModel?.isVisible = false
    }
}
