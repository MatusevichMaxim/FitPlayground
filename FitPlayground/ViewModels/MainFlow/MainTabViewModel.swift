//
//  MainTabViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import Foundation
import Combine

final class MainTabViewModel: ObservableObject {
    @Published var selectedTab: TabItem
    
    let homeTabViewModel: HomeTabViewModel
    let calendarTabViewModel: CalendarTabViewModel
    let workoutsTabViewModel: WorkoutsTabViewModel
    let actionSheetViewModel: ActionSheetViewModel
    let workoutBuilderViewModel: WorkoutBuilderViewModel
    let exerciseSelectorViewModel: ExerciseSelectorViewModel
    
    init(
        mainCoordinator: MainCoordination,
        dialogCoordinator: DialogCoordination,
        defaultSelectedTab: TabItem,
        homeTabViewModel: HomeTabViewModel,
        calendarTabViewModel: CalendarTabViewModel,
        workoutsTabViewModel: WorkoutsTabViewModel,
        actionSheetViewModel: ActionSheetViewModel,
        workoutBuilderViewModel: WorkoutBuilderViewModel,
        exerciseSelectorViewModel: ExerciseSelectorViewModel
    ) {
        self.mainCoordinator = mainCoordinator
        self.dialogCoordinator = dialogCoordinator
        self.selectedTab = defaultSelectedTab
        self.homeTabViewModel = homeTabViewModel
        self.calendarTabViewModel = calendarTabViewModel
        self.workoutsTabViewModel = workoutsTabViewModel
        self.actionSheetViewModel = actionSheetViewModel
        self.workoutBuilderViewModel = workoutBuilderViewModel
        self.exerciseSelectorViewModel = exerciseSelectorViewModel
        
        subscribe()
    }
    
    private let mainCoordinator: MainCoordination
    private let dialogCoordinator: DialogCoordination
    private var subscriptions = [Cancellable]()
}

extension MainTabViewModel {
    private func subscribe() {
        subscriptions = [
            mainCoordinator.isExerciseSelectorPresented.sink { [weak self] _ in
                self?.objectWillChange.send()
            }
        ]
    }
}

extension MainTabViewModel {
    func onDisappear() {
        dialogCoordinator.hideDialog(animated: false)
    }
}
