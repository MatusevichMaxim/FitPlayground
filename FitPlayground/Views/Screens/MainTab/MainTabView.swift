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
                            HomeTabView(viewModel: .init())
                                .tag(item.rawValue)
                            
                        case .calendar:
                            CalendarTabView()
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
        }
    }
}

#Preview {
    MainTabView(viewModel: .init())
}
