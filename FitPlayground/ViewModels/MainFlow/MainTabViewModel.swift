//
//  MainTabViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import Foundation
import Combine
import SwiftUI

final class MainTabViewModel: ObservableObject {
    @Published var selectedTab: TabItem
    
    let mainCoordinator: MainCoordination
    let homeTabViewModel: HomeTabViewModel
    let calendarTabViewModel: CalendarTabViewModel
    let workoutsTabViewModel: WorkoutsTabViewModel
    let actionSheetViewModel: ActionSheetViewModel
    let workoutBuilderViewModel: WorkoutBuilderViewModel
    let exerciseSelectorViewModel: ExerciseSelectorViewModel
    var routingAction = PassthroughSubject<RoutingAction, Never>()
    
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
    
    private let dialogCoordinator: DialogCoordination
    private var subscriptions = [Cancellable]()
}

extension MainTabViewModel {
    func onDisappear() {
        dialogCoordinator.hideDialog(animated: false)
    }
}

extension MainTabViewModel {
    private func subscribe() {
        subscriptions = [
            mainCoordinator.isWorkoutBuilderFlowPresented.sink { [weak self] _ in
                self?.objectWillChange.send()
            }
        ]
    }
}

extension MainTabViewModel: Routing {
    func perform(action: RoutingAction) {
        routingAction.send(action)
    }
}
