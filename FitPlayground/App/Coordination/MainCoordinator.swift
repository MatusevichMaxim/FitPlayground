//
//  MainCoordinator.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import SwiftUI

enum TransitionType {
    case modal
    case push
}

enum TransitionDirection {
    case left
    case right
    case top
    case bottom
}

final class MainCoordinator {
    var isWorkoutBuilderPresented = ValueSubject(false)
    var isExerciseSelectorPresented = ValueSubject(false)
    
    init(setRootView: @escaping (AnyView) -> Void) {
        self.setRootView = setRootView
    }
    
    private var rootView: RoutableView? {
        didSet {
            guard let rootView else { return }
            
            router = rootView
            setRootView(AnyView(rootView))
        }
    }
    
    private let setRootView: (AnyView) -> Void
    private let actionSheetManager = ActionSheetManager()
    private var actionSheetViewModel = ActionSheetViewModel()
    private var router: Routing?
}

extension MainCoordinator: MainCoordination {
    func launch() {
        let homeTabViewModel = HomeTabViewModel(dialogCoordinator: self)
        let calendarTabViewModel = CalendarTabViewModel(dialogCoordinator: self)
        let workoutsTabViewModel = WorkoutsTabViewModel()
        let workoutBuilderViewModel = WorkoutBuilderViewModel(mainCoordinator: self)
        let exerciseSelectorViewModel = ExerciseSelectorViewModel(mainCoordinator: self)
        
        let viewModel = MainTabViewModel(
            coordinator: self,
            defaultSelectedTab: .home,
            homeTabViewModel: homeTabViewModel,
            calendarTabViewModel: calendarTabViewModel,
            workoutsTabViewModel: workoutsTabViewModel,
            actionSheetViewModel: actionSheetViewModel,
            workoutBuilderViewModel: workoutBuilderViewModel,
            exerciseSelectorViewModel: exerciseSelectorViewModel
        )
        let mainTabView = MainTabView(viewModel: viewModel)
        rootView = mainTabView
    }
    
    func navigate(to destination: NavigationDestination) {
        router?.navigate(to: destination)
    }
    
    func navigateBack() {
        router?.navigateBack()
    }
    
    func navigateToRoot() {
        router?.navigateToRoot()
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
        actionSheetViewModel.isVisible = true
    }
    
    func hideDialog() {
        actionSheetViewModel.isVisible = false
    }
}
