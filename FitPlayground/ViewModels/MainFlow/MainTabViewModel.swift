//
//  MainTabViewModel.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/24/24.
//

import Foundation
import Combine

final class MainTabViewModel: ObservableObject {
    let homeTabViewModel: HomeTabViewModel
    let calendarTabViewModel: CalendarTabViewModel
    let workoutsTabViewModel: WorkoutsTabViewModel
    let actionSheetViewModel: ActionSheetViewModel
    let coordinator: MainCoordination
    
    @Published var selectedTab: TabItem
    
    init(
        coordinator: MainCoordination,
        defaultSelectedTab: TabItem,
        homeTabViewModel: HomeTabViewModel,
        calendarTabViewModel: CalendarTabViewModel,
        workoutsTabViewModel: WorkoutsTabViewModel,
        actionSheetViewModel: ActionSheetViewModel
    ) {
        self.selectedTab = defaultSelectedTab
        self.homeTabViewModel = homeTabViewModel
        self.calendarTabViewModel = calendarTabViewModel
        self.workoutsTabViewModel = workoutsTabViewModel
        self.actionSheetViewModel = actionSheetViewModel
        self.coordinator = coordinator
        
        subscribe()
    }
    
    private var subscriptions = [Cancellable]()
}

extension MainTabViewModel {
    private func subscribe() {
        subscriptions = [
            coordinator.isWorkoutBuilderPresented.sink { [weak self] _ in
                self?.objectWillChange.send()
            }
        ]
    }
}
