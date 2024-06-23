//
//  MainTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab: TabItem
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Group {
                    ForEach(TabItem.allCases, id: \.self) { item in
                        switch item {
                        case .home:
                            HomeTabView(workoutsInfo: PreviewData.workoutsPreset)
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
            .onChange(of: selectedTab) { _, newSelection in
                selectedTab = newSelection
            }
            
            TabBarView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainTabView(selectedTab: .home)
}
