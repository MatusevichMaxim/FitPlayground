//
//  MainTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var viewModel: MainTabViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selectedTab) {
                Group {
                    ForEach(TabItem.allCases, id: \.self) { item in
                        switch item {
                        case .home:
                            HomeTabView(viewModel: viewModel.homeTabViewModel)
                                .tag(item.rawValue)
                            
                        case .calendar:
                            CalendarTabView(viewModel: viewModel.calendarTabViewModel)
                                .tag(item.rawValue)
                            
                        case .workouts:
                            WorkoutsTabView()
                                .tag(item.rawValue)
                        }
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.appPrimary, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            }
            .fullScreenCover(isPresented: viewModel.coordinator.isWorkoutBuilderPresented.toBinding()) {
                WorkoutBuilderView(viewModel: viewModel.workoutBuilderViewModel)
            }
            .fullScreenCover(isPresented: viewModel.coordinator.isExerciseSelectorPresented.toBinding()) {
                ExerciseSelectorView(viewModel: viewModel.exerciseSelectorViewModel)
            }
            
            TabBarView(selectedTab: $viewModel.selectedTab)
            
            ActionSheetView(viewModel: viewModel.actionSheetViewModel)
        }
    }
}

#Preview {
    let coordinator = MainCoordinator(setRootView: {_ in })
    
    return MainTabView(viewModel: .init(
        coordinator:  coordinator,
        defaultSelectedTab: .home,
        homeTabViewModel: .init(dialogCoordinator: coordinator),
        calendarTabViewModel: .init(dialogCoordinator: coordinator),
        workoutsTabViewModel: .init(),
        actionSheetViewModel: .init(),
        workoutBuilderViewModel: .init(mainCoordinator: coordinator),
        exerciseSelectorViewModel: .init(mainCoordinator: coordinator)
    ))
}
