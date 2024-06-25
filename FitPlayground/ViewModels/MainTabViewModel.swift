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
    
    init(
        defaultSelectedTab: TabItem,
        homeTabViewModel: HomeTabViewModel,
        calendarTabViewModel: CalendarTabViewModel,
        workoutsTabViewModel: WorkoutsTabViewModel
    ) {
        self.selectedTab = defaultSelectedTab
        self.homeTabViewModel = homeTabViewModel
        self.calendarTabViewModel = calendarTabViewModel
        self.workoutsTabViewModel = workoutsTabViewModel
    }
}
