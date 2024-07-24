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
    
    let mainCoordinator: MainCoordination
    let homeTabViewModel: HomeTabViewModel
    let calendarTabViewModel: CalendarTabViewModel
    let workoutsTabViewModel: WorkoutsTabViewModel
    let actionSheetViewModel: ActionSheetViewModel
    let workoutBuilderViewModel: WorkoutBuilderViewModel
    var routingAction = PassthroughSubject<RoutingAction<MainFlowDestination>, Never>()
    
    init(
        mainCoordinator: MainCoordination,
        dialogCoordinator: DialogCoordination,
        defaultSelectedTab: TabItem,
        homeTabViewModel: HomeTabViewModel,
        calendarTabViewModel: CalendarTabViewModel,
        workoutsTabViewModel: WorkoutsTabViewModel,
        actionSheetViewModel: ActionSheetViewModel,
        workoutBuilderViewModel: WorkoutBuilderViewModel
    ) {
        self.mainCoordinator = mainCoordinator
        self.dialogCoordinator = dialogCoordinator
        self.selectedTab = defaultSelectedTab
        self.homeTabViewModel = homeTabViewModel
        self.calendarTabViewModel = calendarTabViewModel
        self.workoutsTabViewModel = workoutsTabViewModel
        self.actionSheetViewModel = actionSheetViewModel
        self.workoutBuilderViewModel = workoutBuilderViewModel
        
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
    func perform<T>(action: RoutingAction<T>) where T : Destination {
        guard let action = action as? RoutingAction<MainFlowDestination> else { return }
        
        routingAction.send(action)
    }
}
