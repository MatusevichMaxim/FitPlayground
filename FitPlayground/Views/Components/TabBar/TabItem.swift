//
//  TabItem.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 6/22/24.
//

enum TabItem: Int, CaseIterable {
    case home = 0
    case calendar
    case workouts
    
    var icon: AppImageResourse {
        switch self {
        case .home: return .home_tab_icon
        case .calendar: return .calendar_tab_icon
        case .workouts: return .dumbbell_tab_icon
        }
    }
}
