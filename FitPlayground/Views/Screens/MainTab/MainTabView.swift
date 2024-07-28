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
    @ObservedObject var router = NavigationRouter<MainFlowDestination>()
    
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
            .fullScreenCover(isPresented: viewModel.mainCoordinator.isWorkoutBuilderFlowPresented.toBinding()) {
                WorkoutBuilderView(viewModel: viewModel.workoutBuilderViewModel)
            }
            .onDisappear(perform: viewModel.onDisappear)
            .handleNavigationActions(viewModel.routingAction.eraseToAnyPublisher(), router: router)
        }
    }
}

#Preview {
    let mainCoordinator = MainCoordinator(setRootView: {_ in })
    let workoutBuilderCoordinator = WorkoutBuilderCoordinator(isWorkoutBuilderFlowPresented: ValueSubject(false))
    
    return MainTabView(viewModel: .init(
        mainCoordinator: mainCoordinator,
        dialogCoordinator: mainCoordinator,
        defaultSelectedTab: .home,
        homeTabViewModel: .init(dialogCoordinator: mainCoordinator),
        calendarTabViewModel: .init(dialogCoordinator: mainCoordinator),
        workoutsTabViewModel: .init(),
        actionSheetViewModel: .init(),
        workoutBuilderViewModel: .init(
            coordinator: workoutBuilderCoordinator,
            exerciseSelectorViewModel: .init(mainCoordinator: mainCoordinator)
        )
    ))
}
