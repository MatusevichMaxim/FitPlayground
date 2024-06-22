//
//  MainTabView.swift
//  FitPlayground
//
//  Created by Maksim Matusevich on 10/28/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Group {
                HomeTabView(workoutsInfo: PreviewData.workoutsPreset)
                    .tabItem {
                        Image(.home_icon)
                        Text(String.homeTabTitle)
                    }
                
                CalendarTabView()
                    .tabItem {
                        Image(.calendar_icon)
                        Text(String.calendarTabTitle)
                    }
                
                WorkoutsTabView()
                    .tabItem {
                        Image(.dumbbell_icon)
                        Text(String.workoutsTabTitle)
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color.appPrimary, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    MainTabView()
}
