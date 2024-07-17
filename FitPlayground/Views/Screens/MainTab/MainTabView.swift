//
//  MainTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI
import Combine

struct MainTabView: View {
    @ObservedObject var viewModel: MainTabViewModel
    @ObservedObject var router = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
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
                
                TabBarView(selectedTab: $viewModel.selectedTab)
                
                ActionSheetView(viewModel: viewModel.actionSheetViewModel)
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .workoutBuilder:
                    WorkoutBuilderView(viewModel: viewModel.workoutBuilderViewModel)
                case .exerciseSelector:
                    ExerciseSelectorView(viewModel: viewModel.exerciseSelectorViewModel)
                }
            }
        }
        .environmentObject(router)
    }
}

extension MainTabView: Routing {
    func navigate(to destination: NavigationDestination) {
        router.navigate(to: destination)
    }
    
    func navigateBack() {
        router.navigateBack()
    }
    
    func navigateToRoot() {
        router.navigateToRoot()
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
