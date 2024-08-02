//
//  MainCoordinator.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import SwiftUI

final class MainCoordinator {
    var isWorkoutBuilderFlowPresented = ValueSubject(false)
    
    init(setRootView: @escaping (AnyView) -> Void) {
        self.setRootView = setRootView
    }
    
    private let setRootView: (AnyView) -> Void
    private var workoutBuilderCoordinator: WorkoutBuilderCoordination?
    private var router: Routing?
    private let actionSheetManager = ActionSheetManager()
    private let filtersManager = FiltersManager()
    private var actionSheetViewModel = ActionSheetViewModel()
}

extension MainCoordinator: MainCoordination {
    func launch() {
        let workoutBuilderCoordinator = WorkoutBuilderCoordinator(isWorkoutBuilderFlowPresented: isWorkoutBuilderFlowPresented)
        
        let homeTabViewModel = HomeTabViewModel(dialogCoordinator: self)
        let calendarTabViewModel = CalendarTabViewModel(dialogCoordinator: self)
        let workoutsTabViewModel = WorkoutsTabViewModel()
        let exerciseSelectorViewModel = ExerciseSelectorViewModel(
            coordinator: workoutBuilderCoordinator,
            filtersManager: filtersManager,
            filtersProvider: filtersManager
        )
        
        let routingWorkoutBuilderViewModel = WorkoutBuilderViewModel(
            coordinator: workoutBuilderCoordinator,
            exerciseSelectorViewModel: exerciseSelectorViewModel
        )
        workoutBuilderCoordinator.router = routingWorkoutBuilderViewModel
        self.workoutBuilderCoordinator = workoutBuilderCoordinator
        
        let routingViewModel = MainTabViewModel(
            mainCoordinator: self,
            dialogCoordinator: self,
            defaultSelectedTab: .home,
            homeTabViewModel: homeTabViewModel,
            calendarTabViewModel: calendarTabViewModel,
            workoutsTabViewModel: workoutsTabViewModel,
            actionSheetViewModel: actionSheetViewModel,
            workoutBuilderViewModel: routingWorkoutBuilderViewModel
        )
        router = routingViewModel
        let mainTabView = MainTabView(viewModel: routingViewModel)
        setRootView(AnyView(mainTabView))
    }
    
    func launchWorkoutBuilderFlow() {
        workoutBuilderCoordinator?.launch()
    }
}

extension MainCoordinator: DialogCoordination {
    func showDialog(type: DialogType) {
        var builder: ActionSheetBuilder
        
        switch type {
        case .createNew:
            builder = CreateNewActionSheetBuilder(mainCoordinator: self, dialogCoordinator: self)
        case .activityOption(let isDone):
            builder = ActivityOptionActionSheetBuilder(mainCoordinator: self, dialogCoordinator: self, isDone: isDone)
        }
        
        actionSheetViewModel.elements = actionSheetManager.create(using: builder)
        actionSheetViewModel.animationDuration = StyleManager.dialogAnimationDuration
        actionSheetViewModel.isVisible = true
    }
    
    func hideDialog(animated: Bool) {
        actionSheetViewModel.animationDuration = animated ? StyleManager.dialogAnimationDuration : 0
        actionSheetViewModel.isVisible = false
    }
}
